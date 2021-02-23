//
//  Coins.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//
import Foundation
import SpriteKit

//The Coins class. 10 , 25 , 50. Assigning the image according to the value
class Coins:SKSpriteNode {
    private var coinValue = CoinValue.ten
    
    init(coinValue: CoinValue) {
        var texture:SKTexture
        self.coinValue = coinValue
        switch coinValue {
        case .ten:
            texture = SKTexture(imageNamed: "coin10")
        case .twentyFive:
            texture = SKTexture(imageNamed: "coin25")
        case .fifty:
            texture = SKTexture(imageNamed: "coin50")
        }
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "coins"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func getCoinValue()->CoinValue{
        return coinValue
    }


}
