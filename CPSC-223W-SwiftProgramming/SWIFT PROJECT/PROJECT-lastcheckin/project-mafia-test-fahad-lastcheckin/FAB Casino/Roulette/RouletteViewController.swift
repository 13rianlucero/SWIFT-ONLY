//
//  RouletteViewController.swift
//  FAB Casino
//
//  Created by Angel Zambrano on 10/30/20.
//  Copyright © 2020 Angel Zambrano. All rights reserved.
//

import UIKit

class RouletteViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var bet = "None yet"
    var placeToBet = -1
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var betLabel: UILabel!
    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var betPicker: UIPickerView!
    @IBOutlet weak var desiredBet: UITextField!
    @IBOutlet weak var desiredLocation: UITextField!
    var vm = RoulleteViewModel()
    
    @IBAction func cancelBtnAxn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinLabel.text = "Balance: \(vm.getPlayerBalance())" //sets up the coinLabel to update the text                                    depending on how many coins you have
        betLabel.text = "Bet: \(bet)" //^Ditto but with the type of bet
        
        self.betPicker.delegate = self
        self.betPicker.dataSource = self
        
    }
    
    
    //Had to follow this guide to figure out how to set up the pickerview, which includes the numberOfComponents function and both pickerView functions. //https://codewithchris.com/uipickerview-example/
    func numberOfComponents(in pickerView: UIPickerView) -> Int {// One colum
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vm.getTotalBetCount() //rows equal the number of values in bets
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { //retrives the row/bet that the user picked
        bet = vm.getBet(tag: row)
        results.text = vm.getLocationSuggestionTest(bet: bet)
        return bet
    }
    
    @IBAction func runBet(_ sender: UIButton) {
        defer {
            coinLabel.text = "Balance: \(vm.getPlayerBalance())"
        }
        betLabel.text = "Bet: \(bet)" //updates betLabel
        let betText = desiredBet.text! //gets input from the user of the amount that                                 they want to bet
        let betLoc = desiredLocation.text! //^Ditto but with the location
        
        switch bet { //uses the selected bet to run the corresponding odds to simulate             the real deal, then updates the results label to show the user              the outcome or if there was a wrong input
        case "Straight":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 36) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<37) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                
                return
            }
             vm.updateBalance(amount: (Int(betText) ?? 1) * 35)
            results.text = "Congrats, You won!!"
         
            
        case "Split bet":
            guard vm.getPlayerBalance()  >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 18) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<19) else{
                results.text = "Too bad, try again"
               vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            vm.updateBalance(amount: (Int(betText) ?? 1) * 17)
            results.text = "Congrats, You won!!"
            
        case "Corner bet":
            guard  vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 9) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<10) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            vm.updateBalance(amount: (Int(betText) ?? 1) * 8)
            results.text = "Congrats, You won!!"
            
            
        case "Street bet":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 12) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<13) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            vm.updateBalance(amount: (Int(betText) ?? 1) * 11)
            results.text = "Congrats, You won!!"
            
        case "Double street":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 11) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<12) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            
            vm.updateBalance(amount: (Int(betText) ?? 1) * 5)
            results.text = "Congrats, You won!!"
            
        case "Red or Black":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 2) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<3) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            
            vm.updateBalance(amount: (Int(betText) ?? 1))
            results.text = "Congrats, You won!!"
            
        case "Odd or Even":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 2) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<3) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            
            vm.updateBalance(amount: (Int(betText) ?? 1))
            results.text = "Congrats, You won!!"
            
        case "1 - 18":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<3) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            
            vm.updateBalance(amount: (Int(betText) ?? 1))
            results.text = "Congrats, You won!!"
            
        case "19 - 36":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<3) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            
            vm.updateBalance(amount: (Int(betText) ?? 1))
            results.text = "Congrats, You won!!"
            
        case "1st 12":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<4) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            
            vm.updateBalance(amount: (Int(betText) ?? 1) * 2 )
            results.text = "Congrats, You won!!"
            
        case "2nd 12":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<4) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            
            vm.updateBalance(amount: (Int(betText) ?? 1) * 2)
            results.text = "Congrats, You won!!"
            
        case "3rd 12":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<4) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            
            vm.updateBalance(amount: (Int(betText) ?? 1) * 2)
            results.text = "Congrats, You won!!"
            
        case "Colum bet":
            guard vm.getPlayerBalance() >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 3) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<4) else{
                results.text = "Too bad, try again"
                vm.updateBalance(amount: -(Int(betText) ?? 1))
                return
            }
            
            vm.updateBalance(amount: (Int(betText) ?? 1) * 2)
            results.text = "Congrats, You won!!"
        default:
            coinLabel.text = "PICK A BET"
        }
    }
}

