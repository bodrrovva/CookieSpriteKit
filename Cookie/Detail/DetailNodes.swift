//
//  DetailNodes.swift
//  Cookie
//
//  Created by muntyanu on 30.01.2023.
//

import SpriteKit

class DetailNodes: ParentSKNode {

    lazy var hamburgerButton = {
        let hamburger = DetailNodes.createHamburgerButton()
        return hamburger
    }()
    
    lazy var restartButton = {
        let restart = DetailNodes.createRestartButton()
        return restart
    }()
    
    lazy var bowlNode = {
        let bowl = SKSpriteNode(imageNamed: "bowl")
        bowl.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        bowl.setScale(0.3)
        bowl.position = CGPoint(x: screen.width/2, y: 40)
        bowl.zPosition = 1
        
        return bowl
    }()
}
