//
//  GameScene.swift
//  Nano Challenge 2
//
//  Created by Rafa (Ruffles) on 07/08/23.
//

import Foundation
import SpriteKit

class GameScene : SKScene, SKPhysicsContactDelegate {
    // Variables
    let gameController = GameController.shared
    let spawnX : CGFloat = 50
    let spriteScale : CGFloat = 3.2
    
    // Nodes
    var enemyNode : SKSpriteNode = SKSpriteNode()
    var playerNode : SKSpriteNode = SKSpriteNode()
    var speechBalloonNode : SKSpriteNode = SKSpriteNode()

    // SpriteKit event functions
    // "didMove" runs every time the scene is presented by a view
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self;
        GameAnimations.setupAnimations(self, spriteScale)
        setupBackground()
        setupEnemy()
        setupPlayer()
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let location = SKUtils.getFirstTouchPosition(self, touches)
////        spawnBox(location)
//    }
    
    // Utiitary functions
    func enemyEntered() {
        setupSpeechBalloon()
    }
    func setupBackground() {
        let background = SKUtils.setupPixelSpriteFromImage(self, "Background", spriteScale, zPosition: -10)
        background.position = CGPoint(x: frame.width/2, y: frame.height/2)
    }
    func setupEnemy() {
        let enemy = Enemy.getRandomEnemy()
        enemyNode = SKUtils.setupPixelSpriteFromImage(self, enemy.name, spriteScale)
        enemyNode.xScale = -enemyNode.xScale
        enemyNode.position = CGPoint(x: frame.width+spawnX, y: frame.height/3)
        enemyNode.run(GameAnimations.enterRight, completion: enemyEntered)
        enemyNode.run(GameAnimations.idleForeverInverted)
    }
    func setupPlayer() {
        playerNode = SKUtils.setupPixelSpriteFromImage(self, "Player", spriteScale)
        playerNode.position = CGPoint(x: -spawnX, y: frame.height/3)
        playerNode.run(GameAnimations.enterLeft)
        playerNode.run(GameAnimations.idleForever)
    }
    func setupSpeechBalloon() {
        speechBalloonNode = SKUtils.setupPixelSpriteFromImage(self, "SpeechBalloon", spriteScale, zPosition: 10)
        speechBalloonNode.position = CGPoint(x: frame.width/2, y: frame.height/2+55)
    }
    func spawnBox(_ point : CGPoint) {
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = point
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
    }
}
