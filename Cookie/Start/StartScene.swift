//
//  StartScene.swift
//  Cookie
//
//  Created by muntyanu on 09.01.2023.
//

import SpriteKit

class StartScene: ParentScene {
    
    let mainNodes = StartNodes()
    
    override func didMove(to view: SKView) {
        addNodes()
    }
    
    fileprivate func addNodes() {
        addChild(mainNodes.ornamentNode)
        addChild(mainNodes.playLabel)
        addChild(mainNodes.bowlNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = atPoint(location)
        if node.name == "label" {
            sceneManager.gameScene = nil
            transition(scene: GameScene(size: size))
        }
    }
}

