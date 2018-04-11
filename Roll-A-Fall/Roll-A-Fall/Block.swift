//
//  Block.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-04.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
import SpriteKit

protocol Block {
    
    func updater()
}


class BasicBlock: PhysicsObject, Block, Parallaxing{
    var parallaxingSpeed: CGFloat
    
    
    init(pos: CGPoint, parallaxSpeed: CGFloat ){
    self.parallaxingSpeed = parallaxSpeed
        
    //References the super class (PhysicsObject) and initilizes it  within this class
    super.init(nameid: "Block01" , zpos: 2, ipos: pos)
    self.boxCollider = BoxCollider(v1: CGPoint(x: position.x - (size.width/2), y: position.y - (size.height/2)), v2: CGPoint(x: position.x + (size.width/2), y: position.y - (size.height/2)), v3: CGPoint(x: position.x + (size.width/2), y: position.y + (size.height/2)), v4: CGPoint(x: position.x - (size.width/2), y: position.y + (size.height/2)))
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func addSpeed(addativeSpeed: CGFloat) {
        parallaxingSpeed += addativeSpeed
    }
    
    func reduceSpeed(subtractiveSpeed: CGFloat) {
        parallaxingSpeed -= subtractiveSpeed
    }
    
    

    
    func updater() {
        //No Code Needed
    }
}

class EmptyBlock: Block {

    
    func updater() {
        //No Code Needed
    }
}

class VerticalMovingBasicBlock: PhysicsObject, Block, Parallaxing{
    var parallaxingSpeed: CGFloat
    var minHeight: CGFloat?
    var maxHeight: CGFloat?
    var movingUp: Bool?
    
    
    init(pos: CGPoint, parallaxSpeed: CGFloat ){
        self.parallaxingSpeed = parallaxSpeed
        self.movingUp = true
        
        //References the super class (PhysicsObject) and initilizes it  within this class
        super.init(nameid: "Block01" , zpos: 2, ipos: pos)
        self.boxCollider = BoxCollider(v1: CGPoint(x: position.x - (size.width/2), y: position.y - (size.height/2)), v2: CGPoint(x: position.x + (size.width/2), y: position.y - (size.height/2)), v3: CGPoint(x: position.x + (size.width/2), y: position.y + (size.height/2)), v4: CGPoint(x: position.x - (size.width/2), y: position.y + (size.height/2)))
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func addSpeed(addativeSpeed: CGFloat) {
        parallaxingSpeed += addativeSpeed
    }
    
    func reduceSpeed(subtractiveSpeed: CGFloat) {
        parallaxingSpeed -= subtractiveSpeed
    }
    func setMaxMinHeight(min: CGFloat, max: CGFloat)
    {
        self.minHeight = min
        self.maxHeight = max
    }
    
    
    
    
    func updater() {
        
        if (self.position.y > maxHeight!)
        {
            movingUp = false
        }
        
        if (self.position.y < minHeight!)
        {
            movingUp = true
        }
        
        
        if(movingUp)!
        {
            self.position.y += 10
        }
        else
        {
            self.position.y -= 10
        }
    }
}
