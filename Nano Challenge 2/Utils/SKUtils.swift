//
//  SpriteKitUtils.swift
//  Nano Challenge 2
//
//  Created by Rafa (Ruffles) on 07/08/23.
//

import Foundation
import SpriteKit

class SKUtils {
    static func getFirstTouchPosition(_ scene : SKScene, _ touches: Set<UITouch>) -> CGPoint {
        guard let touch = touches.first else {
            print("Touch location error!!!")
            return CGPoint(x: 0, y: 0)
        }
        return touch.location(in: scene)
    }
    
    static func setupPixelSpriteFromImage(_ scene : SKScene, _ imageNamed: String, _ spriteScale : Double, zPosition : CGFloat = 0.0, scale : Bool = true, addChild : Bool = true) -> SKSpriteNode {
        let spriteNode = SKSpriteNode(imageNamed: imageNamed)
        spriteNode.name = imageNamed
        spriteNode.zPosition = zPosition
        
        // Set scale
        if (scale) {
            spriteNode.xScale = CGFloat(spriteScale)
            spriteNode.yScale = CGFloat(spriteScale)
        }
        
        // Fix pixel art texture
        let texture = SKTexture(imageNamed: imageNamed)
        texture.filteringMode = .nearest
        
        // Add child and return
        if (addChild) {
            scene.addChild(spriteNode)
        }
        return spriteNode
    }
}
