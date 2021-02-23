//
//  RoulleteViewModel.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import Foundation
class RoulleteViewModel {
    var bets: [String] = ["Straight", "Split bet", "Corner bet", "Street bet", "Double street", "Red or Black", "Odd or Even", "1 - 18", "19 - 36", "1st 12", "2nd 12", "3rd 12", "Colum bet"] // sets up the array that the pickerView will use
    
    func getBet(tag: Int) -> String {
        if tag >= 0, tag < bets.count {
            return bets[tag]
        }
        return ""
    }
    
    func getLocationSuggestionTest(bet: String) -> String {
        switch bet { // provides directions for each type of bet
        case "Straight":
            return "enter a location from 1-36"
            
        case "Street bet":
            return "Street(row) represented as 1-12"
            
        case "Double street":
            return "two rows represented as 1-11"
            
        case "Red or Black":
            return "represented as 1 or 2"
            
        case "Odd or Even":
            return "represented as 1 or 2"
            
        case "1 - 18":
            return "only put 1"
            
        case "19 - 36":
            return "only put 1"
            
        case "1st 12":
            return "only put 1"
            
        case "2nd 12":
            return"only put 1"
            
        case "3rd 12":
            return "only put 1"
            
        case "Colum bet":
            return "1,2 or 3 since there is only 3 colums"
            
        case "Split bet":
            return "represented as 1 - 18"
            
        case "Corner bet":
            return "represented as 1 - 9"
            
        default:
            return "PICK A BET"
        }
    }
    
    func getTotalBetCount() -> Int {
        return bets.count
    }
    
    func getPlayerBalance() -> Int {
        return UserDefaults.standard.integer(forKey: Constant.user_cash)
    }
    
    func updateBalance(amount: Int) {
        let bal = getPlayerBalance()
        UserDefaults.standard.set(bal + amount, forKey: Constant.user_cash)
    }
}
