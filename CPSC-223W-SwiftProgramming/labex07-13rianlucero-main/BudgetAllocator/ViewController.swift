//
//  ViewController.swift
//  BudgetAllocator
//
//  Created by Paul Inventado on 10/14/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var totalProgress: UIProgressView!
    @IBOutlet var homeProgress: UIProgressView!
    @IBOutlet var transportationProgress: UIProgressView!
    @IBOutlet var groceriesProgress: UIProgressView!
    @IBOutlet var diningProgress: UIProgressView!
    @IBOutlet var entertainmentProgress: UIProgressView!
    
    @IBOutlet var homeAmount: UITextField!
    @IBOutlet var transportationAmount: UITextField!
    @IBOutlet var groceryAmount: UITextField!
    @IBOutlet var diningAmount: UITextField!
    @IBOutlet var entertainmentAmount: UITextField!
    
    @IBOutlet var errorLabel: UILabel!
    
    var manager: BudgetManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = BudgetManager()
        refreshAllocation()
        // Do any additional setup after loading the view.
    }
    
    func refreshAllocation() {
        totalProgress.progress = Float(manager.runningTotal)/100
        if let progress = manager.allocation[.home] {
            homeProgress.progress = Float(progress)/100
        }
        if let progress = manager.allocation[.transportation] {
            transportationProgress.progress = Float(progress)/100
        }
        if let progress = manager.allocation[.groceries] {
            groceriesProgress.progress = Float(progress)/100
        }
        if let progress = manager.allocation[.dining] {
            diningProgress.progress = Float(progress)/100
        }
        if let progress = manager.allocation[.entertainment] {
            entertainmentProgress.progress = Float(progress)/100
        }
    }

    @IBAction func valueUpdated(_ sender: UITextField) {
        if let amount = sender.text {
            if let castedAmount: Double = Double(amount) {
                let currentCategory : BudgetCategory
                switch sender {
                case homeAmount:
                    currentCategory = .home
                case transportationAmount:
                    currentCategory = .transportation
                case groceryAmount:
                    currentCategory = .groceries
                case diningAmount:
                    currentCategory = .dining
                case entertainmentAmount:
                    currentCategory = .entertainment
                default:
                    currentCategory = .home
                }
                let allocated = manager.allocate(category: currentCategory, amount: castedAmount)
                
                if !allocated {
                    errorLabel.text = "Amount exceeds 100."
                    sender.text = "0"
                } else {
                    errorLabel.text = ""
                    refreshAllocation()
                }
            }
        }
    }
}
