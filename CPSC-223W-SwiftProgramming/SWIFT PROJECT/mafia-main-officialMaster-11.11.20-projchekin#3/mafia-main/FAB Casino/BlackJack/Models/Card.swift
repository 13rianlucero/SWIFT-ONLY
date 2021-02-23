//
//  Card.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//
import Foundation
import SpriteKit

class Card:SKSpriteNode {
    private var suit:String = ""
    private var value:Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(suit: String, value: Int) {
        self.suit = suit
        self.value = value
        let texture = SKTexture(imageNamed: suit + String(value))
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
    }
    
    func getCardValue()->Int{
        return value
    }
    
    
}
