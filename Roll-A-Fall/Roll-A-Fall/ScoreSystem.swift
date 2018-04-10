//
//  ScoreSystem.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-04-03.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import Foundation
class ScoreSystem {
    
    var CurrentScore : Int
    var ScoreMultiplyer: Int
    var ScoreBenchmark : [Int]
    var NearestBlock: Block?
    var NearestBlockMaxXPosition: Float
    
    init(GameMode: String)
    {
        self.CurrentScore = 0
        switch GameMode {
        case "Easy":
            self.ScoreMultiplyer = 1
            self.ScoreBenchmark = [100,200,400,800,1600,3200,6400,12800,25600,51200]
            break
        case "Medium":
            self.ScoreMultiplyer = 2
            self.ScoreBenchmark = [100,200,400,800,1600,3200,6400,12800,25600,51200]
            break
        case "Hard":
            self.ScoreMultiplyer = 3
            self.ScoreBenchmark = [100,200,400,800,1600,3200,6400,12800,25600,51200]
            break
        default:
            print("Mode Not Selected")
            self.ScoreMultiplyer = 0
            self.ScoreBenchmark = [0,0,0,0,0,0,0,0,0,0]
            break
        }
        self.NearestBlockMaxXPosition = 0
    }
    //Call Before Update
    //Setup
/*    func SystemStart(Spawner: LevelSpawner, player: Player){
        //Go Through Level Spawner Blocks and find the one closest to the starting position of the ball, set it's max X position to Nearest Block Max X Position
        var firstRun: Bool = true
        for object in Spawner.SimpleGroundObjects
        {
            var distance: Float = Float(object.vert02.x - player.position.x)
            if (distance > 0)
            {
                if(firstRun)
                {
                    NearestBlockMaxXPosition = Float(object.vert02.x)
                    NearestBlock = object
                    firstRun = false
                }
                else
                {
                    if (distance < NearestBlockMaxXPosition)
                    {
                        NearestBlockMaxXPosition = Float(object.vert02.x)
                        NearestBlock = object
                    }
                }
            }
        }
    }
    */
   /* func Updater(Spawner: LevelSpawner, player: Player){
        
        
        if((NearestBlock?.vert02.x)! < player.position.x)
        {
            //Add Score and Grab Nearest Block
            CurrentScore = (1 * ScoreMultiplyer)
            var firstRun : Bool = true
            for object in Spawner.SimpleGroundObjects
            {
                var distance: Float = Float(object.vert02.x - player.position.x)
                if(firstRun)
                {
                    NearestBlockMaxXPosition = Float(object.vert02.x)
                    NearestBlock = object
                    firstRun = false
                }
                else
                {
                    if (distance < NearestBlockMaxXPosition)
                    {
                        NearestBlockMaxXPosition = Float(object.vert02.x)
                        NearestBlock = object
                    }
                }
            }
        }
    }*/
}
