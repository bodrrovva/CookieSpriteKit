//
//  SpriteNodeUsingAtlas.swift
//  Cookie
//
//  Created by muntyanu on 04.02.2023.
//

import SpriteKit

class SpriteNodeUsingAtlas: SKSpriteNode {
    
    fileprivate let textureAtlas: SKTextureAtlas
    fileprivate var textureNameBeingsWith: String
    fileprivate var arrayOfTexture = [SKTexture]()
    fileprivate var initialSize: CGSize
    
    init(textureAtlas: SKTextureAtlas) {
        self.textureAtlas = textureAtlas
        let textureName = textureAtlas.textureNames.sorted()[0]
        let texture = textureAtlas.textureNamed(textureName)
        textureNameBeingsWith = String(textureName.dropLast(5))
        initialSize = texture.size()
        
        super.init(texture: texture, color: .clear, size: initialSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func performTextureAnimate(timePerFrame: TimeInterval, resize: Bool, restore: Bool) {
        arrayPreparation()
        SKTexture.preload(arrayOfTexture) {
            let textureAnimate = SKAction.animate(
                with: self.arrayOfTexture,
                timePerFrame: timePerFrame,
                resize: resize,
                restore: restore
            )
            let repeatForeverAction = SKAction.repeatForever(textureAnimate)
            self.run(repeatForeverAction)
        }
    }
    
    fileprivate func arrayPreparation() {
        for i in 1...textureAtlas.textureNames.count {
            let textureName = textureNameBeingsWith + String(i)
            arrayOfTexture.append(SKTexture(imageNamed: textureName))
        }
    }
}
