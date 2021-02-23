//
//  Player.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//
import Foundation

class Player : BasePlayer{
   var cash:Cash
   private var yields = false
   private var canBet = false
    
    init(hand: Hand, cash: Cash) {
        self.cash = cash
        super.init(hand: hand)
    }
    
    func setYielding(yields: Bool){
        self.yields = yields
    }
    
    func isYeilding()-> Bool{
        return yields
    }
    
    func setCanBet(canBet: Bool){
        self.canBet = canBet
    }
    
    func getCanBet()-> Bool{
        return canBet
    }
}
