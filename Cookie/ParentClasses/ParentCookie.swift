//
//  ParentCookie.swift
//  Cookie
//
//  Created by muntyanu on 20.10.2022.
//

import SpriteKit
import GameplayKit

class ParentCookie: SKSpriteNode {
    
    static func createCookieSpriteNode(imageNamed: String?) -> ParentCookie {
        let randomImageNamed = "cookie" + "\(randomNumberFromOneToSix())"
        let cookie = ParentCookie(imageNamed: imageNamed ?? randomImageNamed)
        cookie.position = CGPoint(x: screen.width/2, y: screen.height/2)
        cookie.name = randomImageNamed
        cookie.zPosition = 3

        return cookie
    }
    
    static func randomNumberFromOneToSix() -> Int {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 6)
        let randomNumber = distribution.nextInt()
        
        return randomNumber
    }
    
    func randomSpawnPoint() -> CGPoint {
        let heightDistribution = GKRandomDistribution(
            lowestValue: Int(screen.height),
            highestValue: Int(screen.height+500)
        )
        let widthDistribution = GKRandomDistribution(
            lowestValue: 100,
            highestValue: Int(screen.width-100)
        )
        let y = CGFloat(heightDistribution.nextInt())
        let x = CGFloat(widthDistribution.nextInt())
        
        return CGPoint(x: x, y: y)
    }
    
    func rotateForRandomAngle() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNumber = CGFloat(distribution.nextInt())
        let angel = randomNumber * CGFloat(Double.pi / 180)
        let rotateAction = SKAction.rotate(toAngle: angel, duration: 0)
        
        return rotateAction
    }
    
    func wiggleAction() -> SKAction {
        let rotR = SKAction.rotate(byAngle: 0.15, duration: 0.2)
        let rotL = SKAction.rotate(byAngle: -0.15, duration: 0.2)
        let cycle = SKAction.sequence([rotR, rotL, rotL, rotR])
        let wiggle = SKAction.repeatForever(cycle)
        
        return wiggle
    }
}
