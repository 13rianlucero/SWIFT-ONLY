//
//  PhoneBookTests.swift
//  PhoneBookTests
//
//  Created by Paul Inventado on 10/3/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import XCTest
@testable import PhoneBook

class PhoneBookTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNoNameWithPhoneAndEmail() throws {
        let content = Contact(name: nil, email: "pinventado@fullerton.edu", phoneNumber: 12345)
        XCTAssertNil(content)
    }
    
    func testNoNameWithNoPhoneWIthEmail() throws {
        let content = Contact(name: nil, email: "pinventado@fullerton.edu", phoneNumber: nil)
        XCTAssertNil(content)
    }
    
    func testNoNameWithPhoneWIthNoEmail() throws {
        let content = Contact(name: nil, email: nil, phoneNumber: 12345)
        XCTAssertNil(content)
    }
    
    func testNoPhoneAndEmail() {
        let content = Contact(name: "Paul", email:nil, phoneNumber: nil)
        XCTAssertNil(content)
    }
    
    func testNameAndPhone() {
        let content = Contact(name: "Paul", email: nil , phoneNumber: 12345)
        XCTAssertNotNil(content)
    }
    
    func testNameAndEmail() {
        let content = Contact(name: "Paul", email: "pinventado@fullerton.edu" , phoneNumber: nil)
        XCTAssertNotNil(content)
    }

}
