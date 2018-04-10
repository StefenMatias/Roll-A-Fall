//
//  SpeedUp.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-08.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
import SpriteKit

class speedUpButton: Gameobject, ObjectClickable {
    
    var boxCol: BoxCollider?
    //var isParallaxingObject: [Parallaxing]
    
    init(nameid: String, initPos: CGPoint) {
        

        super.init(NameId: nameid, zPos: 2, transparency: 1, initialPosition: initPos)
        self.boxCol = BoxCollider(v1: CGPoint(x: position.x - (size.width/2), y: position.y - (size.height/2)), v2: CGPoint(x: position.x + (size.width/2), y: position.y - (size.height/2)), v3: CGPoint(x: position.x + (size.width/2), y: position.y + (size.height/2)), v4: CGPoint(x: position.x - (size.width/2), y: position.y + (size.height/2)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ifClicked() {
        //Speed Up All Paralazing Objects (All Blocks and Background)
       /* for para in isParallaxingObject
        {
            para.addSpeed(addativeSpeed: 5)
        }*/
    }
    
    
}
