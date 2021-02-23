//
//  Pot.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.

//Container for the money in the middle.
class Pot {
    private var pot = 0

    func addMoney(amount: Int){
        pot += amount
    }
    
    func getMoney()->Int{
        return pot
    }
    
    func reset(){
        pot = 0
    }

}
