//
//  ParentScene.swift
//  Cookie
//
//  Created by muntyanu on 23.11.2022.
//

import SpriteKit

class ParentScene: SKScene {
    
    let sceneManager = SceneManager.shared
        
    override init(size: CGSize) {
        super.init(size: size)
        scene?.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        addBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addBackground() {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: screen.width/2, y: screen.height/2)
        background.size = screen
        background.zPosition = 0
        
        addChild(background)
    }
        
    func transition(scene: ParentScene) {
        let transition = SKTransition.crossFade(withDuration: 0)
        scene.scaleMode = .aspectFill
        self.scene!.view?.presentScene(scene, transition: transition)
    }
}
