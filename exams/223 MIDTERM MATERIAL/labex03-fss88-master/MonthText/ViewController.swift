//
//  ViewController.swift
//  MonthText
//
//  Created by Paul Inventado on 9/14/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var converter: Month = Month()

    @IBOutlet var monthNumberText: UITextField!
    @IBOutlet var monthNameLabel: UILabel!
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        converter.number = Int(monthNumberText.text!)!
        monthNumberText.text = String(converter.number)
        monthNameLabel.text = converter.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

