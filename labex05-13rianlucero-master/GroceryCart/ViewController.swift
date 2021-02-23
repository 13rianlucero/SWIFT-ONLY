//
//  ViewController.swift
//  GroceryCart
//
//  Created by Paul Inventado on 9/22/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var quantityText: UITextField!
    @IBOutlet var textView: UITextView!
    
    var cart = Cart()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addItemPressed(_ sender: Any) {
        let quantity = Int(quantityText.text!)
        cart.add(nameLabel.text!, quantity: quantity!)
        nameLabel.text = ""
        quantityText.text = ""
    }
    @IBAction func checkoutButtonPressed(_ sender: Any) {
        print(cart.printOut)
        textView.text = cart.printOut
        textView.text += "Total: $" + String(cart.totalItems)
    }
}

