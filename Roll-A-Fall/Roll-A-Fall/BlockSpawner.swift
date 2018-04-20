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
    public var allBlocks = [Block]()
    var bFactory = BlockFactory()
    var standardY : CGFloat
    var currentSpeed: CGFloat
    var score: Int
    var averageBlockWidth: CGFloat
    
    init(stanY: CGFloat, cSpeed: CGFloat, scoreSystm: ScoreSystem, blockWidth: CGFloat) {
        self.standardY = stanY
        self.currentSpeed = cSpeed
        self.score = currentScore
        self.averageBlockWidth = blockWidth
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Start(){
        //Create 10 Basic Blocks and position them accordingly, and adds them to allBlocks
        //This Runs upon start in order to create a flat level to start the game upon
        var count : CGFloat = 0
        while count != 12 {
            var temp : Block
            temp = bFactory.make(type: "basic", position: CGPoint(x: CGFloat(count * averageBlockWidth) , y: standardY), currentSpeed: currentSpeed)
            allBlocks.append(temp)
            count += 1
        }
        
    }
    
    func Update(){
        // Will Check to see if any blocks are about to be parallaxed, if so this function will update the block with a new block!
        
    }
    
    func createRdmString() -> String {
        var maxRndm: Int
        
        
    }
}
