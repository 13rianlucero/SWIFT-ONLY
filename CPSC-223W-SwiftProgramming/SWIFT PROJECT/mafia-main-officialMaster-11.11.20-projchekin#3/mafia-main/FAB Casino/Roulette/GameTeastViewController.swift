//
//  GameTeastViewController.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import UIKit

class GameTeastViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var coin = 1000
    var bet = "None yet"
    var placeToBet = -1
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var betLabel: UILabel!
    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var betPicker: UIPickerView!
    @IBOutlet weak var desiredBet: UITextField!
    @IBOutlet weak var desiredLocation: UITextField!
    
    
    
    var bets:[String] = [String]()
    
    @IBAction func cancelBtnAxn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinLabel.text = "Coins: \(coin)" //sets up the coinLabel to update the text                                    depending on how many coins you have
        betLabel.text = "Bet: \(bet)" //^Ditto but with the type of bet
        
        bets = ["Straight","Split bet", "Corner bet", "Street bet", "Double street", "Red or Black", "Odd or Even", "1 - 18", "19 - 36", "1st 12", "2nd 12", "3rd 12", "Colum bet"] //sets up the array that the pickerView will use
        self.betPicker.delegate = self
        self.betPicker.dataSource = self
        
    }
    
    
    //Had to follow this guide to figure out how to set up the pickerview, which includes the numberOfComponents function and both pickerView functions. //https://codewithchris.com/uipickerview-example/
    func numberOfComponents(in pickerView: UIPickerView) -> Int {// One colum
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bets.count //rows equal the number of values in bets
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { //retrives the row/bet that the user picked
        bet = bets[row]
        
        switch bet{ //provides directions for each type of bet
        case "Straight":
            results.text = "enter a location from 1-36"
            
        case "Street bet":
            results.text = "Street(row) represented as 1-12"
            
        case "Double street":
            results.text = "two rows represented as 1-11"
            
        case "Red or Black":
            results.text = "represented as 1 or 2"
            
        case "Odd or Even":
            results.text = "represented as 1 or 2"
            
        case "1 - 18":
            results.text = "only put 1"
            
        case "19 - 36":
            results.text = "only put 1"
            
        case "1st 12":
            results.text = "only put 1"
            
        case "2nd 12":
            results.text = "only put 1"
            
        case "3rd 12":
            results.text = "only put 1"
            
        case "Colum bet":
            results.text = "1,2 or 3 since there is only 3 colums"
            
        case "Split bet":
            results.text = "represented as 1 - 18"
            
        case "Corner bet":
            results.text = "represented as 1 - 9"
        
        default:
            results.text = "PICK A BET"
        }
        
        return bet
    }

    @IBAction func runBet(_ sender: UIButton) {
        betLabel.text = "Bet: \(bet)" //updates betLabel
        let betText = desiredBet.text! //gets input from the user of the amount that                                 they want to bet
        let betLoc = desiredLocation.text! //^Ditto but with the location
        
        switch bet { //uses the selected bet to run the corresponding odds to simulate             the real deal, then updates the results label to show the user              the outcome or if there was a wrong input
        case "Straight":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 36) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<37) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 35)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        case "Split bet":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 18) else{
                results.text = "Incorrect Input"
                return
            }
        
            guard Int(betLoc) == Int.random(in: 1..<19) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
        
            self.coin += ((Int(betText) ?? 1) * 17)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
        
        case "Corner bet":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 9) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<10) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 8)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        
        case "Street bet":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 12) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<13) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 11)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        case "Double street":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 11) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<12) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 5)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        case "Red or Black":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 2) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<3) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 1)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        case "Odd or Even":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 2) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<3) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 1)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        case "1 - 18":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<3) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 1)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        case "19 - 36":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<3) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 1)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        case "1st 12":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<4) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 2)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
        
        case "2nd 12":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<4) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 2)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        case "3rd 12":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 1) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<4) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 2)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
            
        case "Colum bet":
            guard coin >= Int(betText) ?? 1 && (Int(betLoc) ?? 1 >= 1 && Int(betLoc) ?? 1 <= 3) else{
                results.text = "Incorrect Input"
                return
            }
            
            guard Int(betLoc) == Int.random(in: 1..<4) else{
                results.text = "Too bad, try again"
                self.coin -= (Int(betText) ?? 1)
                coinLabel.text = "Coins: \(coin)"
                return
            }
            
            self.coin += ((Int(betText) ?? 1) * 2)
            results.text = "Congrats, You won!!"
            coinLabel.text = "Coins: \(coin)"
        default:
            coinLabel.text = "PICK A BET"
        }
    }
}

