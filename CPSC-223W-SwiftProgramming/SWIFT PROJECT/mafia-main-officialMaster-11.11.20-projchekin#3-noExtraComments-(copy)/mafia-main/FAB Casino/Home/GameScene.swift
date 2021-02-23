//
//  GameScene.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var thePlayer:SKSpriteNode = SKSpriteNode()
    var BlackJackTable1:SKSpriteNode = SKSpriteNode()
    var BlackJackTable2:SKSpriteNode = SKSpriteNode()
    var BlackJackTable3:SKSpriteNode = SKSpriteNode()
    let background = SKSpriteNode(imageNamed: "Carpet.jpg")
    var tables:[String] = ["table1", "table2", "table3"]
    var gameName:[String] = ["Game Teast", "Black Jack", "Slot Machine"]
    
    override func didMove(to view: SKView) {
        //sets theMobBoy sprite as theplayer
        if let somePlayer:SKSpriteNode = self.childNode(withName: "theMobBoy") as? SKSpriteNode{
            thePlayer = somePlayer
            thePlayer.physicsBody?.isDynamic = true
            //thePlayer.*whatever*
        }
    }

    func touchMoved(toPoint pos: CGPoint){
        let moveAction:SKAction = SKAction.move(to: pos, duration: 0.25)
        thePlayer.run(moveAction)
    }
    
    func touchUp(atPoint pos: CGPoint){
        let moveAction:SKAction = SKAction.move(to: pos, duration: 1)
        thePlayer.run(moveAction)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        let node = self.atPoint(location!)
        self.tableClick(node: node)
    }
    
    func tableClick(node: SKNode){
        for tableNo in 0 ..< tables.count{
            if node.name == tables[tableNo]{
                self.showOpenGame(tableNo: tableNo)
            }
        }
    }
    
    func showOpenGame(tableNo: Int){
        let alert = UIAlertController(title: nil, message: "Do you want to open \(gameName[tableNo])?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (alert) in
            self.openGame(tableNo: tableNo)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func openGame(tableNo: Int){
        switch tableNo{
        case 0:
            // open game1
            let storyboard = UIStoryboard(name: "GameTeast", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "GameTeastViewController")
            vc.modalPresentationStyle = .fullScreen
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.present(vc, animated: true, completion: nil)
            break
        case 1:
            // open game2
            let vc = BlackJackViewController()
            vc.modalPresentationStyle = .fullScreen
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.present(vc, animated: true, completion: nil)
            break
        case 2:
            // open game3
            let storyboard3 = UIStoryboard(name: "SlotMachine", bundle: nil)
            let vc3 = storyboard3.instantiateViewController(withIdentifier: "ViewController")
            vc3.modalPresentationStyle = .fullScreen
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.present(vc3, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            self.touchMoved(toPoint: t.location(in: self))
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}

