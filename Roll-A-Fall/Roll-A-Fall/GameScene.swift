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
    

    override func didMove(to view: SKView) {
     //Runs At First View Load
    
        //Set Background Color
        backgroundColor = SKColor.black
        
        
        
        
        addChild(background01)
        addChild(background02)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        background01.isParallaxing(maxScreenWidth: 2048)
        background02.isParallaxing(maxScreenWidth: 2048)
        
        if(screenTapped){
            //ScreenTap With Touch Position Recorded
            print("[ " , recentTouchPostion.x, " , ", recentTouchPostion.y, " ]")
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

