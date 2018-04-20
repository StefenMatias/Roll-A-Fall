//
//  GameScene.swift
//  Roll-A-Fall
//
//  Created by Stefen Matias on 2018-03-01.
//  Copyright © 2018 Stefen Matias. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var recentTouchPostion = CGPoint()
    var screenTapped = false
    var background01 : Background = Background(nameid: "Background", ScreenMax: 2048, initPos: CGPoint(x:1024,y:1018), setSpeed: 20)
    var background02 : Background = Background(nameid: "Background", ScreenMax: 2048, initPos: CGPoint(x:3072,y:1018), setSpeed: 20)
    var plaxObjs = [Parallaxing]()
    var IncreaseSpeedButton: speedUpButton = speedUpButton(nameid: "Button_SpeedUp", initPos: CGPoint(x:1800,y:250))
    var DecreaseSpeedButton: slowDownButton = slowDownButton(nameid: "Button_SlowDown", initPos: CGPoint(x:250,y:250))
    var bSpawner: BlockSpawner = BlockSpawner(stanY: 800, cSpeed: 20, currentScore: 0, blockWidth: 200)
    
    var clickableObjs = [ObjectClickable]()
    
    
    
    

    override func didMove(to view: SKView) {
     //Runs At First View Load
        bSpawner.Start()
        
        
        //Load In All Clickable Objects
        clickableObjs.append(IncreaseSpeedButton)
        clickableObjs.append(DecreaseSpeedButton)
        
        //Set Background Color
        backgroundColor = SKColor.black
        
        for blocks in bSpawner.allBlocks{
            addChild(blocks as! SKNode)
        }
        
        addChild(background01)
        addChild(background02)
        addChild(IncreaseSpeedButton)
        addChild(DecreaseSpeedButton)
    }
    
    override func update(_ currentTime: TimeInterval) {
        print(bSpawner.allBlocks.count)
        background01.isParallaxing(maxScreenWidth: 2048)
        background02.isParallaxing(maxScreenWidth: 2048)
        
        for blocks in bSpawner.allBlocks{
            (blocks as! Parallaxing).isParallaxing(maxScreenWidth: 2048)
        }
        
        if(screenTapped){
            //ScreenTap With Touch Position Recorded
            print("[ " , recentTouchPostion.x, " , ", recentTouchPostion.y, " ]")
            
            for cobjs in clickableObjs
            {
                if(cobjs.boxCol?.isCollidingBox(position: recentTouchPostion))!
                {
                    cobjs.ifClicked()
                    print("Clicked")
                    screenTapped = false
                }
            }
            
        }
    }
    
    
    //Screen Tap
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchPosition = touch.location(in: self)
            recentTouchPostion = touchPosition
            screenTapped = true
        }
        
    }
}

