//
//  LevelSpawner.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-01.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
import SpriteKit

class LevelSpawner{
    
    var SimpleGroundObjects =  [BlockGameObject]()
    var mostRecentlySpawnedBloack: BlockGameObject?
    var screenMaxWandH: CGPoint
    var firstRun: Bool = false;
    var LevelSpawner: LevelSpawner
    
    init(ScreenMaxWidth: CGFloat, ScreenMaxHeight: CGFloat, lvlspwn: LevelSpawner )
    {
        self.screenMaxWandH = CGPoint(x: ScreenMaxWidth, y: ScreenMaxHeight)
        self.LevelSpawner = lvlspwn
    }
    public func isSpawnerRunning (running: Bool)
    {
        //This will be the only callable function to determine if the spawner is running or not.
        if(firstRun)
        {
            //Spawn First Block
            
            //Set First Spawn To mostRecentlySpawned
            
            //After firstRun, set to false
            firstRun = false
        }
        
        if (running && !firstRun){
            
            //check if most recently spawned block has passed on screen
            if((mostRecentlySpawnedBloack?.vert02.x)! <= screenMaxWandH.x)
            {
                //Spawn Next Block With Current Difficulty Level In Mind
                spawnNextBlock(DifficultyLevel: 0)
            }
            
        }
    }
    
    
     func spawnNextBlock( DifficultyLevel: Int)
    {
        // This Block Will Take Into Account The Current Games Level Of Difficulty.
    }
    
     func deleteBlocks() {
        
    }
}
