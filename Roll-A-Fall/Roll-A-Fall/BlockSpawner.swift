//
//  BlockSpawner.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-04.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
import SpriteKit

class BlockSpawner {
    var allBlocks = [Block]()
    var bFactory = BlockFactory()
    var standardY : CGFloat
    var currentSpeed: CGFloat
    
    init(stanY: CGFloat, cSpeed: CGFloat) {
        self.standardY = stanY
        self.currentSpeed = cSpeed
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Start(){
        //Create 10 Blocks and position them accordingly.
        var count : CGFloat = 0
        var randomnum : CGFloat = 0
        while count != 5 {
            //Randomly Choose A Block To Create between 1 and 6
            randomnum = CGFloat(Int(arc4random_uniform(6)) + 1)
            switch randomnum {
            case 1:
                allBlocks.append(BasicBlock(pos: CGPoint(x: 0 + (count * 200) ,y: standardY), parallaxSpeed: currentSpeed))
                break
            default:
                print("Random Num Not Within Options")
            }

            
            
            count += 1
        }
        
    }
}
