//
//  BlackJackTests.swift
//  FAB CasinoTests
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

@testable import FAB_Casino
import XCTest

class BlackJackTests: XCTestCase {
    var vm: BlackJackViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = BlackJackViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUpdateMoneyPot() {
        vm?.updateMoneyPot(amount: 100)
        XCTAssert(vm?.getMoneyFromPot() == 100)
    }

    func testGetPlayerBalance() {
        XCTAssert(vm?.getPlayerBalance() ?? 0 >= 0)
    }

    func testUpdateDealerCardY() {
        vm?.updateDealerCardY(pos: 800)
        XCTAssert(vm?.getDealerCardY() == 800)
    }

    func testUpdatePlayerCardY() {
        vm?.updatePlayerCardY(pos: 800)
        XCTAssert(vm?.getPlayerCardY() == 800)
    }

    func testPerformance() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
