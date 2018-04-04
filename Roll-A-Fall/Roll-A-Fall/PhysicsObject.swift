//
//  PhysicsObject.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-04.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
import SpriteKit

protocol PhysicsNonStatic {
    //Physics objects that do adhere to gravity and are also collidable
    
    //Acceleration: The value in which velocity is increasing or decreasing by per frame
    var acceleration: CGFloat {get set}
    //Velocity: The value in which the Physics object is moving by per frame
    var velocity : CGFloat {get set}
    //A Bool that is used to signify that an object is resting upon another object and that gravity is not pushing it further
    var isGrounded: Bool {get set}
    //Acceleration strictly through gravity
    var gravitationalAcceleration: CGFloat {get set}

    //Objects that may add "Force" (Jumping, Speeding Up, Slowing Down)
    func addInstantaneousVelocity(addThis: CGFloat)
     func addInstantaneousAcceleration(addThis: CGFloat)
    //Used to apply forces, like friction, drag, gravity ect
    func updateNonStaticPhysics()
    func applyGravity(objectGrounded: Bool)
}

class PhysicsObject: Gameobject {
    //All objects that can collide with other objects and also can possibly be affected by other forces for instance gravity
    var vert01 : CGPoint = CGPoint()
    var vert02 : CGPoint = CGPoint()
    var vert03 : CGPoint = CGPoint()
    var vert04 : CGPoint = CGPoint()
    
    
    // Asset Name, Z-Position, Alpha
    init(nameid: String,zpos: CGFloat, ipos: CGPoint ){
    
        
        
        
        //References the super class (Gameobject) and initilizes it  within this class
        super.init(NameId: nameid, zPos: zpos, transparency: 1, initialPosition: ipos)
        self.vert01 = CGPoint(x: position.x - (size.width/2), y: position.y - (size.height/2))
        self.vert02 = CGPoint(x: position.x + (size.width/2), y: position.y - (size.height/2))
        self.vert03 = CGPoint(x: position.x + (size.width/2), y: position.y + (size.height/2))
        self.vert04 = CGPoint(x: position.x - (size.width/2), y: position.y + (size.height/2))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Function That Can Be Called When youre checking to see if an object is colliding with this object and you want the object to operate with a box collider and collide with a box collider. The object you input is the one with the box collider
    func isCollidingBox(positions: [CGPoint]) -> Bool {
        for position in positions {
            if(position.x > vert01.x && position.x < vert02.x && position.y > vert01.y && position.y < vert03.y ){
                return true
            }
        }
        return false
    }
    //USE IF POSITION HAS CHANGED SINCE INIT
    func updateCollider() {
        self.vert01 = CGPoint(x: position.x - (size.width/2), y: position.y - (size.height/2))
        self.vert02 = CGPoint(x: position.x + (size.width/2), y: position.y - (size.height/2))
        self.vert03 = CGPoint(x: position.x + (size.width/2), y: position.y + (size.height/2))
        self.vert04 = CGPoint(x: position.x - (size.width/2), y: position.y + (size.height/2))
    }
    
    //Function That Can Be Called When youre checking to see if an object is colliding with this object and you want the object to operate with a circle collider and collide with a box collider. The object you input is the one with the box collider
    /*func isCollidingCircle(positions: [CGPoint]) -> Bool {
     if( ) {
     
     }
     }*/

}
