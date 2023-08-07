//
//  Enemy.swift
//  Nano Challenge 2
//
//  Created by Rafa (Ruffles) on 07/08/23.
//

import Foundation

class Enemy {
    var name = ""
    
    init(_ name : String){
        self.name = name
    }
    
    static let enemies : [Enemy] = [
        Enemy("Rat")
    ]
    
    static func getRandomEnemy() -> Enemy {
        guard let randomEnemy = enemies.randomElement() else {
            print("Random enemy error!")
            return enemies[0]
        }
        return randomEnemy
    }
}
