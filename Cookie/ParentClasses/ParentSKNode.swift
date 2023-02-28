//
//  ParentSKNode.swift
//  Cookie
//
//  Created by muntyanu on 30.01.2023.
//

import SpriteKit

class ParentSKNode: SKNode {
    
    static func createLabel(text: String, size: CGFloat, position: CGPoint) -> SKLabelNode {
        let attrString = NSMutableAttributedString(string: text)
        let atrrKey = NSAttributedString.Key.self
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let range = NSRange(location: 0, length: text.count)
        let color = UIColor(named: "AccentColor")!
        let font = UIFont(name: "Marker Felt Wide", size: size)!
        
        attrString.addAttribute(atrrKey.paragraphStyle, value: paragraphStyle, range: range)
        attrString.addAttributes([atrrKey.foregroundColor: color, atrrKey.font: font], range: range)
        
        let label = SKLabelNode()
        
        label.attributedText = attrString
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = screen.width-100
        label.scene?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        label.position = position
        label.zPosition = 1
        label.name = "label"
        label.alpha = 0
        label.run(SKAction.fadeIn(withDuration: 1.5))
        
        return label
    }
    
    static func createHamburgerButton() -> SKSpriteNode {
        let hamburger = SKSpriteNode(imageNamed: "hamburger")
        hamburger.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        hamburger.setScale(0.4)
        hamburger.position = CGPoint(x:screen.width-110, y: screen.height-60)
        hamburger.name = "hamburger"
        hamburger.zPosition = 1
        
        return hamburger
    }
    
    static func createRestartButton() -> SKSpriteNode {
        let restart = SKSpriteNode(imageNamed: "restart")
        restart.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        restart.setScale(0.4)
        restart.position = CGPoint(x: screen.width-35, y: screen.height-60)
        restart.name = "restart"
        restart.zPosition = 1
        
        return restart
    }
}
