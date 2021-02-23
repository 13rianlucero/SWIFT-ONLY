//
//  ViewController.swift
//  Steakhouse
//
//  Created by Paul Inventado on 9/2/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var theSteak = Steak(uncookedWeight: 8, internalTemperature: 100)
    
    @IBOutlet var internalTemperatureLabel: UILabel!
    
    @IBOutlet var weightLabel: UILabel!

    @IBOutlet var steakImage: UIImageView!
    
    @IBAction func cookButton(_ sender: Any) {
        if theSteak.doneness != "Burnt" {
            theSteak.cook()
            update()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update() {
        steakImage.image = UIImage(named: theSteak.doneness)
        internalTemperatureLabel.text = String(theSteak.internalTemperature) + "°F"
        weightLabel.text = String(theSteak.cookedWeight) + " oz."
    }


}

