//
//  Card.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//
import Foundation
import SpriteKit

//The deck of cards logic. Suite and Value.
// 4 suites, and 13 Values: A = 1 , 2 3 4 5 6 7 8 9 10 , 11 = J, 12 = Q , 13 = K
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
