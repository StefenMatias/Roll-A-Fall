//
//  Gameobject.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-04.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
import SpriteKit

class Gameobject : SKSpriteNode{
    

    
    //Position So Background can be background and game objects can operate at different layers
    
    // Asset Name, Z-Position, Alpha
    init(NameId: String, zPos : CGFloat, transparency : CGFloat , initialPosition: CGPoint) {
        
        //Get The Texture out of the assets.zcassets folder that is found through the initilization call
        let tex = SKTexture(imageNamed: NameId)
        // Color
        let col = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: transparency)
        
        //Size of texture inputed
        let s = tex.size()
        
        
        
        //References the super class (SKSpriteNode) and initilizes it  within this class
        super.init(texture: tex, color : col,size: s)
        self.zPosition = zPos
        self.position = initialPosition
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

