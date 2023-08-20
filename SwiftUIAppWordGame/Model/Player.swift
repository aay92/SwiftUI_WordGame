//
//  Player.swift
//  SwiftUIAppWordGame
//
//  Created by Aleksey Alyonin on 20.08.2023.
//

import Foundation

struct Player {
    let name: String
    private(set) var score = 0 ///private(set) - можно менять переменную только внутри этой структуры
    
    mutating func add(score: Int) {
        self.score += score
    }
}
