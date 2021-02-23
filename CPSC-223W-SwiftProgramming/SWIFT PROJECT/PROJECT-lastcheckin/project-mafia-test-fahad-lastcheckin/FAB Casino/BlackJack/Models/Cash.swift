//
//  Cash.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import Foundation

class Cash {
    var amount = UserDefaults.standard.integer(forKey: Constant.user_cash)
    
    func getBalance()->Int{
        return amount
    }
    
    func removeBalance(amount: Int){
        self.amount -= amount
        UserDefaults.standard.set(self.amount, forKey: Constant.user_cash)
    }
    
    func addAmount(amount: Int){
       self.amount += amount
        UserDefaults.standard.set(self.amount, forKey: Constant.user_cash)
    }
    
  }
