//
//  ViewController.swift
//  VendingMachine
//
//  Created by Paul Inventado on 11/18/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var coinsLabel: UILabel!
    @IBOutlet var candyBarPriceLabel: UILabel!
    @IBOutlet var chipsPriceLabel: UILabel!
    @IBOutlet var pretzelsPriceLabel: UILabel!
    @IBOutlet var candyBarQtyLabel: UILabel!
    @IBOutlet var chipsQtyLabel: UILabel!
    @IBOutlet var pretzelsQtyLabel: UILabel!
    
    @IBOutlet var errorLabel: UILabel!
    
    var vendo = VendingMachine()
    
    @IBAction func depositCoinPressed(_ sender: Any) {
        vendo.coinsDeposited += 1
        updateUI()
    }
    
    @IBAction func buyCandyBarAction(_ sender: Any) {
        buy(name: "Candy Bar")
    }
    
    @IBAction func buyChipsAction(_ sender: Any) {
        buy(name: "Chips")
    }
    
    @IBAction func buyPretzelsAction(_ sender: Any) {
        buy(name: "Pretzels")
    }
    
    func buy(name: String) {
        // TODO: Complete the body of the buy method. Call the vend method and
        // use do-catch to handle all erorrs it throws. Update the errorLabel
        // text according to the error you receive.
        
        do {
         try vendo.vend(itemNamed: name)
        } catch VendingMachineError.invalidSelection {
         errorLabel.text = "Invalid Selection"
        } catch VendingMachineError.outOfStock {
         errorLabel.text = "Out of Stock"
        } catch VendingMachineError.insufficientFunds {
         errorLabel.text = "Please insert more coins"
        } catch {
         errorLabel.text = "RUH ROH"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        errorLabel.text = ""
        coinsLabel.text = String(vendo.coinsDeposited)
        candyBarPriceLabel.text = "$ \(vendo.inventory["Candy Bar"]!.price)"
        chipsPriceLabel.text = "$ \(vendo.inventory["Chips"]!.price)"
        pretzelsPriceLabel.text = "$ \(vendo.inventory["Pretzels"]!.price)"
        
        candyBarQtyLabel.text = "x \(vendo.inventory["Candy Bar"]!.count)"
        chipsQtyLabel.text = "x \(vendo.inventory["Chips"]!.count)"
        pretzelsQtyLabel.text = "x \(vendo.inventory["Pretzels"]!.count)"
    }
}

