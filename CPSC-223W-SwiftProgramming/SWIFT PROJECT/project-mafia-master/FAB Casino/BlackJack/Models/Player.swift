//
//  Player.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//
import Foundation

//The player class.
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
    //Checking if the user can bet or not, depending on status of the game at the time.
    func setCanBet(canBet: Bool){
        self.canBet = canBet
    }
    //Getting if the user can bet or not, depending on status of the game at the time.
    func getCanBet()-> Bool{
        return canBet
    }
}
