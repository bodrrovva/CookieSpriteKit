//
//  GameNodes.swift
//  Cookie
//
//  Created by muntyanu on 30.01.2023.
//

import SpriteKit

class GameNodes: ParentSKNode {
    
    lazy var statusBarNode = {
        let statusBar = SpriteNodeUsingAtlas(textureAtlas: SKTextureAtlas(named: "StatusBar"))
        statusBar.setScale(0.2)
        statusBar.anchorPoint = CGPoint(x: 0.1, y: 1.0)
        statusBar.position = CGPoint(x: 30, y: screen.height-45)
        statusBar.zPosition = 2
        statusBar.name = "StatusBar"
        statusBar.performTextureAnimate(timePerFrame: 0.2, resize: false, restore: true)
        
        return statusBar
    }()
    
    lazy var hamburgerButton = {
        let hamburger = GameNodes.createHamburgerButton()
        return hamburger
    }()
    
    lazy var restartButton = {
        let restart = GameNodes.createRestartButton()
        return restart
    }()
    
    lazy var laodingLabel = {
        let label = GameNodes.createLabel(
            text: "Loading...",
            size: 20,
            position: CGPoint(x: screen.width/2, y: screen.height/2)
        )
        
        return label
    }()
    
    lazy var emptyLabel = {
        let label = GameNodes.createLabel(
            text: "It's empty here",
            size: 20,
            position: CGPoint(x: screen.width/2, y: screen.height/2)
        )
        
        return label
    }()
}
