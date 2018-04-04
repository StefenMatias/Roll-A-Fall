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


class BasicBlock: PhysicsObject, PhysicsStatic, Block {
    

    
    func updater() {
        //No Code Needed
    }
}

class EmptyBlock: Block {

    
    func updater() {
        //No Code Needed
    }
}
