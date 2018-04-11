//
//  BlockFactory.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-04.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
import SpriteKit


class BlockFactory {
    //Create Blocks
    
    func make(type: String, position: CGPoint, currentSpeed: CGFloat) -> Block {
        
        switch type {
        case "basic":
            return BasicBlock(pos: position, parallaxSpeed: currentSpeed)
            
        case "basicVertical":
            return BasicBlock(pos: position, parallaxSpeed: currentSpeed)
            
        case "basicMovingVertical":
            return VerticalMovingBasicBlock(pos: position, parallaxSpeed: currentSpeed)
            
        default:
            print("type does not conform to list of types")
            return BasicBlock(pos: position, parallaxSpeed: currentSpeed)
            
        }
    }
}
