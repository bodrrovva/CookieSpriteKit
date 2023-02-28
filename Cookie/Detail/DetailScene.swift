//
//  DetailScene.swift
//  Cookie
//
//  Created by muntyanu on 20.10.2022.
//

import SpriteKit

class DetailScene: ParentScene {

    let detailNodes = DetailNodes()
    var cookieImageNamed = ""
    
    override func didMove(to view: SKView) {
        addNodes()
        spawnCookie()
    }
    
    fileprivate func addNodes() {
        addChild(detailNodes.hamburgerButton)
        addChild(detailNodes.restartButton)
        addChild(detailNodes.bowlNode)
    }
    
    fileprivate func spawnCookie() {
        let cookie = ParentCookie.createCookieSpriteNode(imageNamed: self.cookieImageNamed)
        cookie.setScale(0.5)
        cookie.run(cookie.wiggleAction())
        self.addChild(cookie)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        switch node.name {
        case "restart":
            sceneManager.gameScene = nil
            transition(scene: GameScene(size: size))
        case "hamburger":
            transition(scene: StartScene(size: size))
        default:
            transition(scene: QuoteScene(size: size))
        }
    }
}


