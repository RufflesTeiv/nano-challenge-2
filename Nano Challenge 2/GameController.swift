//
//  GameController.swift
//  Nano Challenge 2
//
//  Created by Rafa (Ruffles) on 02/08/23.
//

import Foundation

class GameController : ObservableObject {
    static var shared: GameController = {
        let instance = GameController()
        return instance
    }()
    
    var playerName : String = ""
    var money : Int = 0
    var currentEnemy : Enemy = Enemy.enemies[0]
    
    private init(){}
}
