//
//  SlotMachineTests.swift
//  FAB CasinoTests
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import XCTest
@testable import FAB_Casino
class SlotMachineTests: XCTestCase {
    var vm: SlotMachineViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = SlotMachineViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func testGetScore() {
        XCTAssert(vm?.getScore() ?? 0 >= 0)
    }
    
    func testGetImagesCount(){
        XCTAssert(vm?.getImagesCount() == 6)
        
    }
    
    func testGetRandomNumber() {
        XCTAssert(vm?.getRandomNumber() ?? 0 >= 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
