//
//  PPEFactoryTests.swift
//  PPEFactoryTests
//
//  Created by Paul Inventado on 10/28/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import XCTest
@testable import PPEFactory

class PPEFactoryTests: XCTestCase {
    
    func testInitBudget() {
        let factory = Factory(budget: 100)
        XCTAssertEqual(factory.budget, 100)
    }
    
    func testProductionIncrement() {
        let factory = Factory(budget: 100)
        factory.startProduction()
        let expectation = self.expectation(description: "Increment item counts")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertGreaterThanOrEqual(factory.alcoholCount, 1)
        XCTAssertGreaterThanOrEqual(factory.gloveCount, 1)
        XCTAssertGreaterThanOrEqual(factory.maskCount, 1)
    }
    
    
    func testProductionIncrementByMultiplierNon1() {
        let factory = Factory(budget: 100)
        factory.alcoholMultiplier = 3
        factory.gloveMultiplier = 2
        factory.maskMultiplier = 8
        factory.startProduction()
        
        let expectation = self.expectation(description: "Increment by Multiplier")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(factory.alcoholCount, 6)
        XCTAssertEqual(factory.gloveCount, 4)
        XCTAssertEqual(factory.maskCount, 16)
    }
    
    func testProductionBudget() {
        let factory = Factory(budget: 0)
        factory.alcoholMultiplier = 3
        factory.gloveMultiplier = 2
        factory.maskMultiplier = 8
        factory.startProduction()
        
        let expectation = self.expectation(description: "Increment Budget")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            factory.purchase(item: .alcohol, quantity: 3, callbackSuccess: {}, callbackFailure: {})
            factory.purchase(item: .glove, quantity: 1, callbackSuccess: {}, callbackFailure: {})
            factory.purchase(item: .mask, quantity: 4, callbackSuccess: {}, callbackFailure: {})
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        // ALCOHOL_PRICE = 2.0
        // GLOVE_PRICE = 1.0
        // MASK_PRICE = 3.0
        XCTAssertEqual(factory.budget, 19 )
    }
    
    func testPurchaseSuccess1() {
        let factory = Factory(budget: 0)
        factory.startProduction()
        var purchaseSuccess = false
        let expectation = self.expectation(description: "Increment Budget")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            factory.purchase(item: .alcohol, quantity: 1, callbackSuccess: {
                purchaseSuccess = true
            }, callbackFailure: {})
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(purchaseSuccess)
    }
    
    func testPurchaseSuccess2() {
        let factory = Factory(budget: 0)
        factory.startProduction()
        var purchaseSuccess = false
        let expectation = self.expectation(description: "Increment Budget")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
            factory.purchase(item: .alcohol, quantity: 2, callbackSuccess: {
                purchaseSuccess = true
            }, callbackFailure: {})
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(purchaseSuccess)
    }
    
    func testPurchaseFails() {
        let factory = Factory(budget: 0)
        factory.startProduction()
        var purchaseSuccess = false
        let expectation = self.expectation(description: "Increment Budget")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
           factory.purchase(item: .alcohol, quantity: 3, callbackSuccess: {
               purchaseSuccess = true
           }, callbackFailure: {})
           expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertFalse(purchaseSuccess)
    }
    
    func testUpgradeSucceeds() {
        let factory = Factory(budget: 100)
        factory.alcoholMultiplier = 3
        factory.startProduction()
        let expectation = self.expectation(description: "Increment Budget")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            factory.upgrade(item: .alcohol)
           expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(factory.budget, 91)
        XCTAssertEqual(factory.alcoholMultiplier, 4)
    }
    
    func testUpgradeFailure() {
        let factory = Factory(budget: 2)
        factory.alcoholMultiplier = 3
        factory.startProduction()
        let expectation = self.expectation(description: "Increment Budget")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            factory.upgrade(item: .alcohol)
           expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(factory.budget, 2)
        XCTAssertEqual(factory.alcoholMultiplier, 3)
    }

}
