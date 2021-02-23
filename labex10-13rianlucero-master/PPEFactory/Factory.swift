//
//  Factory.swift
//  PPEFactory
//
//  Created by Paul Inventado on 10/28/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import Foundation

let ALCOHOL_PRICE = 2.0
let GLOVE_PRICE = 1.0
let MASK_PRICE = 3.0

enum Item: CaseIterable {
    case alcohol, glove, mask
}

class Factory: CustomStringConvertible {
    var alcoholMultiplier: Int
    var gloveMultiplier: Int
    var maskMultiplier: Int

    var alcoholCount: Int
    var gloveCount: Int
    var maskCount: Int

    var budget: Double
    var productionTimer: Timer?

    var description: String {
        "\(alcoholCount) \(maskCount) \(gloveCount)"
    }

    init(budget: Double) {
        alcoholMultiplier = 1
        gloveMultiplier = 1
        maskMultiplier = 1

        alcoholCount = 0
        gloveCount = 0
        maskCount = 0

        self.budget = budget
    }

    func startProduction() {
        // TODO: Create a Timer and use a closure to increment the alcohol, glove, and mask
        // count using the appropriate multipliers (e.g., alcohol count + alcohol multiplier)
        // Hint: You can store the result of the timer into self.productionTimer so you can
        //       stop the timer.

        let timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            self.alcoholCount += 1 * self.alcoholMultiplier
            self.gloveCount += 1 * self.gloveMultiplier
            self.maskCount += 1 * self.maskMultiplier
        }
        productionTimer = timer
    } // end of startProduction

    // TODO: Create a purchase member function that accepts an Item called item, its
    // quantity called quantity, a closure that does not accept parameters and does not
    // return a value called callbackSuccess, and a closure that does not accept parameters
    // and does not return a value called callbackFailure
    //
    // The function should perform the following:
    // 1. Check whether there is enough of the item's quantity to purchase. For example,
    //    if the item purchased is 5 alcohol, then it will check if there are at lease 5
    //    alcohol.
    // 2. If there is enough of the item, reduce the current number in stock. For example,
    //    remove the 5 alcohol for the alcohol count.
    // 3. If there is enough of the item, also increase your budget by the price of the item
    //    multiplied by the number of items purchased. For example, 5 * ALCOHOL_PRICE is
    //    added to the budget. Feel free to use ALCOHOL_PRICE, GLOVE_PRICE, and MASK_PRICE
    //    to make it easy to use prices.
    // 4. If there is enough of the item, call the callbackSuccess function.
    // 5. However, if there is not enough of the item, call the callbackFailure function.

    func purchase(item: Item, quantity: Double, callbackSuccess: () -> Void, callbackFailure: () -> Void) {
        switch item {
        case .alcohol:
            if alcoholCount >= Int(quantity) {
                callbackSuccess()
                alcoholCount -= Int(quantity)
                budget += quantity * ALCOHOL_PRICE
            } else {
                callbackFailure()
            }
        case .glove:
            if gloveCount >= Int(quantity) {
                callbackSuccess()
                gloveCount -= Int(quantity)
                budget += quantity * GLOVE_PRICE
            } else {
                callbackFailure()
            }
        case .mask:
            if maskCount >= Int(quantity) {
                callbackSuccess()
                maskCount -= Int(quantity)
                budget += quantity * MASK_PRICE
            } else {
                callbackFailure()
            }
        }
    } // end of the purchase function

    // TODO: Make sure that productionTimer is set in the startProduction function for
    // this to work.
    func stopProduction() {
        if let timer = productionTimer {
            timer.invalidate()
        }
    }

    // TODO: Create an upgrade member function. This function will upgrade the multiplier of
    // a particular item to speed up the factory's production. The function accepts an Item
    // parameter called item. It will perform the following steps:
    //
    // 1. It will compute the cost of the upgrade, which is the square of the item's
    //    multiplier. For example, if the multiplier of alcohol is currently 3, then its cost
    //    will be 3 ^ 2 = 9.
    // 2. It will check whether there is enough budget to pay for the upgrade. For example,
    //    if the budget is $10 and the upgrade cost is $9, then it will proceed.
    // 3. If there is enough budget, it will subtract the cost from the budget. For example,
    //    the cost $9 is subtracted from the budget $10 leaving $1 on the budget.
    // 4. If there is enough buddget, it will increment the appropriate item multiplier by 1.
    //    For example, if the previous multiplier for alcohol was 3, then it will become 4.

    func upgrade(item: Item) {
        switch item {
        case .alcohol:
            let cost = alcoholMultiplier * alcoholMultiplier
            if budget >= Double(cost) {
                budget -= Double(cost)
                alcoholMultiplier += 1
            }
        case .glove:
            let cost = gloveMultiplier * gloveMultiplier
            if budget >= Double(cost) {
                budget -= Double(cost)
                gloveMultiplier += 1
            }
        case .mask:
            let cost = maskMultiplier * maskMultiplier
            if budget >= Double(cost) {
                budget -= Double(cost)
                maskMultiplier += 1
            }
        }
    } // end of upgrade function
}
