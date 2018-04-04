//
//  Player.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-03-08.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
import SpriteKit
class Player: PhysicsObject, PhysicsNonStatic {
    
    var grounded: Bool
    var acceleration: CGFloat
    var velocity : CGFloat
    var jumpVelocity: CGFloat
    var gravitationalAcceleration: CGFloat
    var isJumping: Bool
    var isGrounded: Bool
    init (StartingPosition: CGPoint) {
        
        self.grounded = false
        self.acceleration = 0
        self.velocity = 0
        self.jumpVelocity = 55
        self.isJumping = false
        self.isGrounded = true
        self.gravitationalAcceleration = 0
        //References the super class (Gameobject) and initilizes it  within this class
        super.init(nameid: "Player", zpos: 2, ipos:CGPoint(x:1000, y:1000) )
        
        self.position = StartingPosition
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addInstantaneousVelocity(addThis: CGFloat) {
        self.velocity += addThis
    }
    
    func addInstantaneousAcceleration(addThis: CGFloat) {
        self.acceleration += addThis
    }
    func applyGravity(objectGrounded: Bool) {
        if(objectGrounded){
            gravitationalAcceleration = 0
        }
        else {
            gravitationalAcceleration = 9.8
        }
    }
    
    func updateNonStaticPhysics() {
        if(acceleration > -9.8 && !grounded)
        {
            acceleration += gravitationalAcceleration
        }
        velocity -= acceleration
        position.y += velocity
        print("y: ", velocity)
    }
    
    
    func updatePlayer(){
        
        
        // --- PHYSICS STUFF---
        grounded = isGrounded;
        //Apply Gravity
        applyGravity(objectGrounded: grounded)
        
        //On The Ground Player Velocity is Zero
        if(grounded && !isJumping){
           // velocity = 0
            print("Grounded")
        }
        //When Player taps screen it will turn is jumping true, this will set the velocity to the jump velocity
        if(isJumping && grounded){
            addInstantaneousVelocity(addThis: jumpVelocity)
            grounded = false
            addInstantaneousAcceleration(addThis: 10)
            isJumping = false
            print("Jumped")
        }
        //Adjust Velocity While Player Is Airborn based on gravity
       // if(isJumping && !grounded){
         //   velocity = velocity + acceleration
        //}
        
        updateNonStaticPhysics()
    }
    
    
}
