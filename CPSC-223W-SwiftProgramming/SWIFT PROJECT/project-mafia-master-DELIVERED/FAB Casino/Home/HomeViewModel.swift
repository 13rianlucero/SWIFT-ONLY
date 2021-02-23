//
//  HomeViewModel.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import Foundation

class HomeViewModel {
    var tables: [String] = ["table1", "table2", "table3"]
    var gameName: [String] = ["Roulette", "Black Jack", "Slot Machine"]
    
    func getTotalTableCount() -> Int {
        return tables.count
    }
    
    func getTotalGameCount() -> Int {
        return gameName.count
    }
    
    func getTableForIndex(_ index: Int) -> String {
        if index >= 0, index < tables.count {
            return tables[index]
        }
        return ""
    }
    
    func getGameForIndex(_ index: Int) -> String {
        if index >= 0, index < gameName.count {
            return gameName[index]
        }
        return ""
    }
    
    func add(amount: Int) {
        var total = getBalance()
        total += amount
        UserDefaults.standard.set(total, forKey: Constant.user_cash)
    }
    
    func getBalance() -> Int {
        return UserDefaults.standard.integer(forKey: Constant.user_cash)
    }
}
