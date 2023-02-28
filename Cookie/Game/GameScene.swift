//
//  GameScene.swift
//  Cookie
//
//  Created by muntyanu on 13.10.2022.
//

import SpriteKit
import CoreMotion

class GameScene: ParentScene, SKPhysicsContactDelegate {
    
    fileprivate let gameNodes = GameNodes()
    fileprivate var startTouch = CGPoint()
    fileprivate let motionManager = CMMotionManager()
    fileprivate var enabledActionsWithCookies = false

    override func didMove(to view: SKView) {
        checkCountOfChidren()
        
        guard sceneManager.gameScene == nil else { return }
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        physicsWorld.contactDelegate = self
        
        addNodes()
        spawnCookies()
    }
    
    fileprivate func checkCountOfChidren() {
        if self.children.count == 4 {
            addChild(gameNodes.emptyLabel)
        }
    }
    
    fileprivate func addNodes() {
        addChild(gameNodes.statusBarNode)
        addChild(gameNodes.hamburgerButton)
        addChild(gameNodes.restartButton)
        addChild(gameNodes.laodingLabel)
    }
    
    fileprivate func spawnCookies() {

        let startSpawnCookies = SKAction.run {
            self.switchOffCoreMotion()
        }
        
        let spawnOneCookie = SKAction.run {
            let cookie = ParentCookie.createCookieSpriteNode(imageNamed: nil)
            cookie.setScale(0.25)
            cookie.position = cookie.randomSpawnPoint()
            cookie.run(cookie.rotateForRandomAngle())
            cookie.physicsBody = SKPhysicsBody(circleOfRadius: max(cookie.size.width/2, cookie.size.height/2))
            cookie.physicsBody?.affectedByGravity = true
            cookie.physicsBody?.isDynamic = true
            cookie.physicsBody?.allowsRotation = true
            cookie.physicsBody?.restitution = 0.5
            self.addChild(cookie)
        }
        
        let finishSpawnCookies = SKAction.run {
            let statusBar = self.atPoint(CGPoint(x: 35, y: screen.height-50))
            let loadingLabel = self.atPoint(CGPoint(x: screen.width/2, y: screen.height/2))
            
            statusBar.removeAllActions()
            loadingLabel.removeFromParent()
            self.turnOnCoreMotion()
            self.enabledActionsWithCookies = true
        }
        
        let waitAction = SKAction.wait(forDuration: drand48())
        let spawnOneCookieWithWaitAction = SKAction.sequence([spawnOneCookie, waitAction])
        let spawnAllCookies = SKAction.repeat(spawnOneCookieWithWaitAction, count: 30)
        let unificationOfAllActions = SKAction.sequence([startSpawnCookies, spawnAllCookies, finishSpawnCookies])
        
        run(unificationOfAllActions)
    }
    
    fileprivate func turnOnCoreMotion() {
            self.motionManager.startAccelerometerUpdates()
            self.physicsBody = SKPhysicsBody(
                edgeLoopFrom: CGRect(x: 0, y: 15, width: screen.width, height: screen.height-20)
            )
    }
    
    fileprivate func switchOffCoreMotion() {
        self.motionManager.stopAccelerometerUpdates()
        physicsBody = SKPhysicsBody(
            edgeLoopFrom: CGRect(x: 0, y: 15, width: screen.width, height: screen.height+500)
        )
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(
                dx: accelerometerData.acceleration.x * 25,
                dy: accelerometerData.acceleration.y * 25
            )
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches { startTouch = touch.location(in: self) }
        let node = atPoint(startTouch)
        
        switch node.name {
        case "restart":
            sceneManager.gameScene = nil
            transition(scene: GameScene(size: size))
        case "hamburger":
            transition(scene: StartScene(size: size))
        default: break
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var endTouch = CGPoint()
        for touch in touches { endTouch = touch.location(in: self) }
        let node = atPoint(startTouch)
        
        if enabledActionsWithCookies {
            node.physicsBody?.applyImpulse(
                CGVector(dx: endTouch.x - startTouch.x + 50,dy: endTouch.y - startTouch.y + 50)
            )
        }
    }
    
    @objc func doubleTapped() {
        let node = atPoint(startTouch)
        if node.name?.contains("cookie") == true && enabledActionsWithCookies {
            node.removeFromParent()
            self.isPaused = true
            sceneManager.gameScene = self
            let scene = DetailScene(size: size)
            scene.cookieImageNamed = node.name!
            transition(scene: scene)
        }
    }
}
