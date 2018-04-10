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
    var boxCollider: BoxCollider?
    
    

    // Asset Name, Z-Position, Alpha
    init(nameid: String,zpos: CGFloat, ipos: CGPoint ){
        
        //References the super class (Gameobject) and initilizes it  within this class
        super.init(NameId: nameid, zPos: zpos, transparency: 1, initialPosition: ipos)
        self.boxCollider = BoxCollider(v1: CGPoint(x: position.x - (size.width/2), y: position.y - (size.height/2)), v2: CGPoint(x: position.x + (size.width/2), y: position.y - (size.height/2)), v3: CGPoint(x: position.x + (size.width/2), y: position.y + (size.height/2)), v4: CGPoint(x: position.x - (size.width/2), y: position.y + (size.height/2)))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class BoxCollider {
    var vert01 : CGPoint
    var vert02 : CGPoint
    var vert03 : CGPoint
    var vert04 : CGPoint
    
    init(v1: CGPoint,v2: CGPoint, v3: CGPoint, v4: CGPoint ){
        self.vert01 = v1
        self.vert02 = v2
        self.vert03 = v3
        self.vert04 = v4
    }
    init (gameobj: Gameobject )
    {
        self.vert01 = CGPoint(x: gameobj.position.x - (gameobj.size.width/2), y: gameobj.position.y - (gameobj.size.height/2))
        self.vert02 = CGPoint(x: gameobj.position.x + (gameobj.size.width/2), y: gameobj.position.y - (gameobj.size.height/2))
        self.vert03 = CGPoint(x: gameobj.position.x + (gameobj.size.width/2), y: gameobj.position.y + (gameobj.size.height/2))
        self.vert04 = CGPoint(x: gameobj.position.x - (gameobj.size.width/2), y: gameobj.position.y + (gameobj.size.height/2))
    }
    
    func updateCollider(gameobj: Gameobject) {
        self.vert01 = CGPoint(x: gameobj.position.x - (gameobj.size.width/2), y: gameobj.position.y - (gameobj.size.height/2))
        self.vert02 = CGPoint(x: gameobj.position.x + (gameobj.size.width/2), y: gameobj.position.y - (gameobj.size.height/2))
        self.vert03 = CGPoint(x: gameobj.position.x + (gameobj.size.width/2), y: gameobj.position.y + (gameobj.size.height/2))
        self.vert04 = CGPoint(x: gameobj.position.x - (gameobj.size.width/2), y: gameobj.position.y + (gameobj.size.height/2))
    }
    
    func updateCollider(gameobj: PhysicsObject) {
        self.vert01 = CGPoint(x: gameobj.position.x - (gameobj.size.width/2), y: gameobj.position.y - (gameobj.size.height/2))
        self.vert02 = CGPoint(x: gameobj.position.x + (gameobj.size.width/2), y: gameobj.position.y - (gameobj.size.height/2))
        self.vert03 = CGPoint(x: gameobj.position.x + (gameobj.size.width/2), y: gameobj.position.y + (gameobj.size.height/2))
        self.vert04 = CGPoint(x: gameobj.position.x - (gameobj.size.width/2), y: gameobj.position.y + (gameobj.size.height/2))
    }
    
    func isCollidingBox(positions: [CGPoint]) -> Bool {
        for position in positions {
            if(position.x > vert01.x && position.x < vert02.x && position.y > vert01.y && position.y < vert03.y ){
                return true
            }
        }
        return false
    }
}
