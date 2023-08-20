//
//  GameViewModel.swift
//  SwiftUIAppWordGame
//
//  Created by Aleksey Alyonin on 20.08.2023.
//

import Foundation

enum WordError: Error {
    case theSameWord
    case bofforeWord
    case littleWord
    case wrongWord
    case undefinedError
    
}

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
    
    func validate(word: String) throws {
        let word = word.uppercased()
        guard word != self.word else {
            print("Думаешь самый умный, составленное слово не должно быть исходным")
            throw WordError.theSameWord
        }
        guard !(words.contains(word)) else {
            print("Прояви фонтазию и придумай новое слово")
            throw WordError.bofforeWord
        }
        guard word.count > 1 else {
            print("Слишком короткое слово")
            throw WordError.littleWord
        }
        return
    }
    
    func wordToCharts(word: String) -> [Character] {
        var charts = [Character]()
        for char in word.uppercased() {
            charts.append(char)
        }
        return charts
    }
    
    func check(word: String) throws -> Int {
        do {
            try self.validate(word: word)
        } catch {
           throw error
        }
        
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
                throw WordError.wrongWord
            }
        }
        
        guard result == word.uppercased() else {
            print("Неизвестная ошибка")
            return 0
        }
        
        words.append(result)
        if isFirst {
            player1.score += result.count
        } else {
            player2.score += result.count
        }
        
        isFirst.toggle()
        return result.count
    }
    
}
