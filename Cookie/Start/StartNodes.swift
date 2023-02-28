//
//  StartNodes.swift
//  Cookie
//
//  Created by muntyanu on 18.01.2023.
//

import SpriteKit

class StartNodes: ParentSKNode {
    
    lazy var ornamentNode = {
        let ornament = SpriteNodeUsingAtlas(textureAtlas: SKTextureAtlas(named: "Ornament"))
        ornament.setScale(0.25)
        ornament.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        ornament.position = CGPoint(x: screen.width/2, y: screen.height-50)
        ornament.zPosition = 1
        ornament.performTextureAnimate(timePerFrame: 0.4, resize: false, restore: true)
        
        return ornament
    }()
    
    lazy var playLabel = {
        let label = StartNodes.createLabel(
            text: "Play",
            size: 40,
            position: CGPoint(x: screen.width/2, y: screen.height/2)
        )
        label.run(self.scaleAction())
        
        return label
    }()
    
    lazy var bowlNode = {
        let bowl = SKSpriteNode(imageNamed: "bowl")
        bowl.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        bowl.setScale(0.3)
        bowl.position = CGPoint(x: screen.width/2, y: 40)
        bowl.zPosition = 1
        
        return bowl
    }()
    
    fileprivate func scaleAction() -> SKAction {
        let scaleBy = SKAction.scale(by: 1.2, duration: 0.5)
        let scaleTo = SKAction.scale(to: 1, duration: 0.5)
        let sequence = SKAction.sequence([scaleBy, scaleTo])
        let foreverAction = SKAction.repeatForever(sequence)
        
        return foreverAction
    }
}
