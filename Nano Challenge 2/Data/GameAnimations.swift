//
//  GameAnimations.swift
//  Nano Challenge 2
//
//  Created by Rafa (Ruffles) on 07/08/23.
//

import Foundation
import SpriteKit

public class GameAnimations {
    // Variables
    static var spriteScale = 1.0
    static let squishInterval = 0.3
    static let squishMinusMultiplier = 0.9
    static let squishMaximMultiplier = 1.1
    static let moveXPosition = 100
    static let moveInterval = 0.5
    
    // Animations
    static var idle: SKAction = SKAction()
    static var idleForever: SKAction = SKAction()
    static var idleInverted: SKAction = SKAction()
    static var idleForeverInverted : SKAction = SKAction()
    static var enterLeft: SKAction = SKAction()
    static var enterRight: SKAction = SKAction()
    
    static func setupAnimations(_ scene : SKScene, _ spriteScale : CGFloat) {
        // Idle Animation
        self.spriteScale = spriteScale
        setupIdleAnimation(inverted: false)
        setupIdleAnimation(inverted: true)
        
        // Enter Left Animation
        enterLeft.timingMode = .easeInEaseOut
//        let enterLeftSingle = SKAction.moveTo(x: CGFloat(moveXPosition), duration: moveInterval)
//        enterLeft = SKAction.sequence([enterLeftSingle, idleForever])
        enterLeft = SKAction.moveTo(x: CGFloat(moveXPosition), duration: moveInterval)
        
        // Enter Right Animation
        enterRight.timingMode = .easeInEaseOut
//        let enterRightSingle = SKAction.moveTo(x: scene.frame.width - CGFloat(moveXPosition), duration: moveInterval)
//        enterRight = SKAction.sequence([enterRightSingle, idleForeverInverted])
        enterRight = SKAction.moveTo(x: scene.frame.width - CGFloat(moveXPosition), duration: moveInterval)
    }
    
    static func setupIdleAnimation(inverted: Bool = false) {
        let invertedMultiplier : Double = inverted ? -1 : 1
        let squishMinus = spriteScale*squishMinusMultiplier
        let squishMaxim = spriteScale*squishMaximMultiplier
        let squishVertical = SKAction.group([SKAction.scaleX(to: invertedMultiplier*squishMinus, duration: squishInterval), SKAction.scaleY(to: squishMaxim, duration: squishInterval)])
        let squishHorizontal = SKAction.group([SKAction.scaleX(to: invertedMultiplier*squishMaxim, duration: squishInterval), SKAction.scaleY(to: squishMinus, duration: squishInterval)])
        
        if (inverted) {
            idleInverted.timingMode = .easeInEaseOut
            idleInverted = SKAction.sequence([squishVertical, squishHorizontal])
            idleForeverInverted = SKAction.repeatForever(idleInverted)
        } else {
            idle.timingMode = .easeInEaseOut
            idle = SKAction.sequence([squishVertical, squishHorizontal])
            idleForever = SKAction.repeatForever(idle)
        }
    }
}
