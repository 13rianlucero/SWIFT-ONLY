//
//  ViewController.swift
//  Restaurant
//
//  Created by Paul Inventado on 8/31/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mealCostInput: UITextField!
    @IBOutlet var tipPercentageInput: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var subTotalLabel: UILabel!
    @IBOutlet var taxesLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    @IBAction func calculateBillPressed(_ sender: Any) {
        let mealCost = Double(mealCostInput.text!)!
        let tipPercentage = Double(tipPercentageInput.text!)!
        
        subTotalLabel.text = "$" + String(mealCost)
        taxesLabel.text = "$" + String(taxes(subTotal: mealCost))
        tipLabel.text = "$" + String(tip(subTotal: mealCost, tipPercentage: tipPercentage))
        totalLabel.text = "$" + String(total(subTotal: mealCost, tipPercentage: tipPercentage))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

