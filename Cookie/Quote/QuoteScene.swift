//
//  QuoteScene.swift
//  Cookie
//
//  Created by muntyanu on 27.11.2022.
//

import SpriteKit

class QuoteScene: ParentScene {
    
    let predicationNodes = QuoteNodes()
    var networkService = NetworkService()
    
    override func didMove(to view: SKView) {
        addNodes()
    }
    
    fileprivate func addNodes() {
        addChild(predicationNodes.hamburgerButton)
        addChild(predicationNodes.restartButton)
        addChild(predicationNodes.leftHandNode)
        addChild(predicationNodes.rightHandNode)
        
        networkService.performRequest() { discription in
            let quoteLabel = QuoteNodes.createQuoteLabel(text: "«\(discription.first!.quote)»")
            self.addChild(quoteLabel)
            
            let authorLabel = QuoteNodes.createAuthorLabel(text: "- " + String(discription.first!.author))
            self.addChild(authorLabel)
        }
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
            guard let scene = sceneManager.gameScene else { return }
            transition(scene: scene)
        }
    }
}
