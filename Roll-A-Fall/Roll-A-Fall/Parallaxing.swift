//
//  Parallaxing.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-07.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
import SpriteKit
protocol Parallaxing {
    var parallaxingSpeed: CGFloat {get set}
    
    func isParallaxing(maxScreenWidth : Int)
    
    func changeSpeed (newSpeed: CGFloat)
    func addSpeed (addativeSpeed: CGFloat)
    func reduceSpeed (subtractiveSpeed: CGFloat)
}

class Background: Gameobject, Parallaxing {
    var parallaxingSpeed: CGFloat
    
    func isParallaxing(maxScreenWidth: Int) {
        self.position.x -= parallaxingSpeed
        
        if(self.position.x <= ((-1) * self.size.width/2))
        {
            self.position.x = (CGFloat(maxScreenWidth) + self.size.width/2)
        }
    }
    
    func changeSpeed(newSpeed: CGFloat) {
        self.parallaxingSpeed = newSpeed
    }
    
    func addSpeed (addativeSpeed: CGFloat)
    {
        parallaxingSpeed += addativeSpeed
    }
    func reduceSpeed (subtractiveSpeed: CGFloat)
    {
        parallaxingSpeed -= subtractiveSpeed
    }
    
    
    
    //Position So Background can be background and game objects can operate at different layers
    // Asset Name, Z-Position, Alpha
    init(nameid: String, ScreenMax: CGFloat,initPos: CGPoint, setSpeed: CGFloat ) {
        
        self.parallaxingSpeed = setSpeed
        super.init(NameId: nameid, zPos: 0, transparency: 1, initialPosition: initPos)
        //self.parallaxingSpeed = setSpeed
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
        
        
}

