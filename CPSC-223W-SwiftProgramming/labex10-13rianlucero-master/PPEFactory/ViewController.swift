//
//  ViewController.swift
//  PPEFactory
//
//  Created by Paul Inventado on 10/28/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var producer: Factory!
    var purchased: Bool!
    var ordersPerSecond: Int!
    var recentOrdersPerSecond: [Int]!
    var timeElapsed: Double!

    var itemQueue: [(Item, Int)]!

    @IBOutlet var itemLabels: [UILabel]!

    @IBOutlet var alcoholFactoryLabel: UILabel!
    @IBOutlet var gloveFactoryLabel: UILabel!
    @IBOutlet var maskFactoryLabel: UILabel!
    @IBOutlet var budgetFactoryLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!

    @IBOutlet var upgradeAlcoholButton: UIButton!
    @IBOutlet var upgradeGloveButton: UIButton!
    @IBOutlet var upgradeMaskButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        ordersPerSecond = 0
        recentOrdersPerSecond = []
        timeElapsed = 0
        producer = Factory(budget: 100)
        producer.startProduction()
        itemQueue = []
        start()
    }

    func start() {
        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            if self.timeElapsed >= 1 {
                self.recentOrdersPerSecond.append(self.ordersPerSecond)
                if self.recentOrdersPerSecond.count > 10 {
                    self.recentOrdersPerSecond.removeFirst()
                }
                let averageSpeed = self.recentOrdersPerSecond.reduce(0) {
                    $0 + $1
                } / self.recentOrdersPerSecond.count
                self.speedLabel.text = String(averageSpeed) + " orders/second"
                self.timeElapsed = 0
                self.ordersPerSecond = 0
            }
            self.timeElapsed += 0.001
            if self.itemQueue.count < 10 {
                let randomItem = Item.allCases.randomElement()!
                let randomQuantity = Int.random(in: 1 ... 100)

                self.itemQueue.append((randomItem, randomQuantity))
                self.updateItemQueue()
            }

            if let producer = self.producer {
                producer.purchase(item: self.itemQueue[0].0, quantity: Double(self.itemQueue[0].1), callbackSuccess: {
                    self.itemQueue.removeFirst()
                    self.updateItemQueue()
                    self.ordersPerSecond += 1
                }, callbackFailure: {})
            }
            self.updateFactoryState()
        }
    }

    func updateFactoryState() {
        alcoholFactoryLabel.text = String(producer.alcoholCount) + " x 💦 Alcohol "
        gloveFactoryLabel.text = String(producer.gloveCount) + " x 🧤 Glove"
        maskFactoryLabel.text = String(producer.maskCount) + " x 😷 Mask"
        budgetFactoryLabel.text = "$" + String(producer.budget)

        upgradeAlcoholButton.setTitle("Upgrade 💦 Alcohol ($" + String(pow(Double(producer.alcoholMultiplier), 2)) + ")", for: .normal)
        upgradeGloveButton.setTitle("Upgrade 🧤 Glove ($" + String(pow(Double(producer.gloveMultiplier), 2)) + ")", for: .normal)
        upgradeMaskButton.setTitle("Upgrade 😷 Mask ($" + String(pow(Double(producer.maskMultiplier), 2)) + ")", for: .normal)
    }

    func updateItemQueue() {
        var index: Int = 0
        for (item, quantity) in itemQueue {
            var type = ""
            switch item {
            case .alcohol:
                type = "💦 Alcohol"
            case .glove:
                type = "🧤 Glove"
            case .mask:
                type = "😷 Mask"
            }
            itemLabels[index].text = String(quantity) + " x " + type
            index += 1
        }
    }

    @IBAction func upgradeAlcoholPressed(_ sender: Any) {
        producer.upgrade(item: .alcohol)
    }

    @IBAction func upgradeGlovePressed(_ sender: Any) {
        producer.upgrade(item: .glove)
    }

    @IBAction func upgradeMaskPressed(_ sender: Any) {
        producer.upgrade(item: .mask)
    }
}
