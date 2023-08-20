//
//  GameViewModel.swift
//  SwiftUIAppWordGame
//
//  Created by Aleksey Alyonin on 20.08.2023.
//

import Foundation

class GameViewModel: ObservableObject { ///ObservableObject - реактивщина
    
    @Published var player1: Player
    @Published var player2: Player
    @Published var words = [String]()
    
    let word: String
    var isFirst = true
    
    init(player1: Player, player2: Player, word: String) {
        self.player1 = player1
        self.player2 = player2
        self.word = word.uppercased()
        
    }
    
    func validate(word: String) -> Bool {
        let word = word.uppercased()
        guard word != self.word else {
            print("Думаешь самый умный, составленное слово не должно быть исходным")
            return false }
        guard !(words.contains(word)) else {
            print("Прояви фонтазию и придумай новое слово")
            return false
        }
        guard word.count > 1 else {
            print("Слишком короткое слово")
            return false
        }
        return true
    }
    
    func wordToCharts(word: String) -> [Character] {
        var charts = [Character]()
        for char in word.uppercased() {
            charts.append(char)
        }
        return charts
    }
    
    func check(word: String) -> Int {
        guard self.validate(word: word) else { return 0 }
        var bidWordArray = wordToCharts(word: self.word)
        var smallWordArray = wordToCharts(word: word)
        
        var result = ""
        
        for char in smallWordArray {
            if bidWordArray.contains(char) {
                result.append(char)
                var i = 0
                while bidWordArray[i] != char {
                    i += 1
                }
                bidWordArray.remove(at: i)
            } else {
                print("Такое слово не может быть составленно")
                return 0
            }
        }
        
        guard result == word.uppercased() else {
            print("Неизвестная ошибка")
            return 0
        }
        
        words.append(result)
        if isFirst {
            player1.add(score: result.count)
        } else {
            player2.add(score: result.count)
        }
        
        isFirst.toggle()
        return result.count
    }
    
}
