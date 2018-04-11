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
    
    var clickableObjs = [ObjectClickable]()
    
    
    var b01 : BasicBlock = BasicBlock(pos: CGPoint(x: 100,y:750), parallaxSpeed: 20)
    var b02 : VerticalMovingBasicBlock = VerticalMovingBasicBlock(pos: CGPoint(x:300, y:750 ), parallaxSpeed: 20)
    var b03 : BasicBlock = BasicBlock(pos: CGPoint(x: 500,y:750), parallaxSpeed: 20)
    var b04 : BasicBlock = BasicBlock(pos: CGPoint(x: 700,y:750), parallaxSpeed: 20)
       var b05 : VerticalMovingBasicBlock = VerticalMovingBasicBlock(pos: CGPoint(x:900, y:750 ), parallaxSpeed: 20)
    var b06 : BasicBlock = BasicBlock(pos: CGPoint(x: 1300,y:750), parallaxSpeed: 20)
    var b07 : BasicBlock = BasicBlock(pos: CGPoint(x: 1700,y:750), parallaxSpeed: 20)
    var b08 : BasicBlock = BasicBlock(pos: CGPoint(x: 1900,y:750), parallaxSpeed: 20)
    

    override func didMove(to view: SKView) {
     //Runs At First View Load
        
        //Load In All ParallaxingObjects
        plaxObjs.append(background01)
        plaxObjs.append(background02)
        plaxObjs.append(b01)
        plaxObjs.append(b02)
        plaxObjs.append(b03)
        plaxObjs.append(b04)
        plaxObjs.append(b05)
        plaxObjs.append(b06)
        plaxObjs.append(b07)
        plaxObjs.append(b08)
        IncreaseSpeedButton.setParallaxingObjects(parallaxingObjs: plaxObjs)
        DecreaseSpeedButton.setParallaxingObjects(parallaxingObjs: plaxObjs)
        
        
        //Load In All Clickable Objects
        clickableObjs.append(IncreaseSpeedButton)
        clickableObjs.append(DecreaseSpeedButton)
        
        //Set Background Color
        backgroundColor = SKColor.black
        
        //Set Heights
        b02.setMaxMinHeight(min: 750, max: 1000)
        b05.setMaxMinHeight(min: 750, max: 1000)
        
        
        
        
        addChild(background01)
        addChild(background02)
        addChild(b01)
        addChild(b02)
        addChild(b03)
        addChild(b04)
        addChild(b05)
        addChild(b06)
        addChild(b07)
        addChild(b08)
        addChild(IncreaseSpeedButton)
        addChild(DecreaseSpeedButton)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        background01.isParallaxing(maxScreenWidth: 2048)
        background02.isParallaxing(maxScreenWidth: 2048)
        b01.isParallaxing(maxScreenWidth: 2048)
        b02.isParallaxing(maxScreenWidth: 2048)
        b03.isParallaxing(maxScreenWidth: 2048)
        b04.isParallaxing(maxScreenWidth: 2048)
        b05.isParallaxing(maxScreenWidth: 2048)
        b06.isParallaxing(maxScreenWidth: 2048)
        b07.isParallaxing(maxScreenWidth: 2048)
        b08.isParallaxing(maxScreenWidth: 2048)
        b02.updater()
        b05.updater()
        
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

