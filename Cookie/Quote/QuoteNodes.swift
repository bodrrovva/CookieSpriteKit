//
//  QuoteNodes.swift
//  Cookie
//
//  Created by muntyanu on 30.01.2023.
//
import SpriteKit

class QuoteNodes: ParentSKNode {
    
    static func createQuoteLabel(text: String) -> SKLabelNode {
        let label = QuoteNodes.createLabel(
            text: text,
            size: 22,
            position: CGPoint(x: screen.width/2, y: screen.height/2+40)
        )
        
        return label
    }
    
    static func createAuthorLabel(text: String) -> SKLabelNode {
        let label = QuoteNodes.createLabel(
            text: text,
            size: 15,
            position: CGPoint(x: screen.width/2, y: screen.height/2-40)
        )
    
        return label
    }
    
    lazy var hamburgerButton = {
        let hamburger = DetailNodes.createHamburgerButton()
        return hamburger
    }()
    
    lazy var restartButton = {
        let restart = DetailNodes.createRestartButton()
        return restart
    }()
    
    lazy var leftHandNode = {
        let leftHand = createHand(
            imageName: "leftHand",
            point: CGPoint(x: screen.width/2-80, y: 0),
            zPosition: 2,
            moveTo: CGPoint(x: screen.width/2-130, y: 0)
        )
        
        return leftHand
    }()
    
    lazy var rightHandNode = {
        let rightHand = createHand(
            imageName: "rightHand",
            point: CGPoint(x: screen.width/2+80, y: 0),
            zPosition: 1,
            moveTo: CGPoint (x: screen.width/2+150, y: 0)
        )

        return rightHand
    }()
    
    fileprivate func createHand(imageName: String, point: CGPoint, zPosition: CGFloat, moveTo: CGPoint) -> SKSpriteNode {
        let hand = SKSpriteNode(imageNamed: imageName)
        hand.setScale(0.35)
        hand.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        hand.position = point
        hand.zPosition = zPosition
        hand.run(SKAction.move(to: moveTo, duration: 0.7))
        
        return hand
    }
}
