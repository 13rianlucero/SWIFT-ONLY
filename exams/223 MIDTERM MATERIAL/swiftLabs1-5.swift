//
//  File.swift
//  
//
//  Created by Brian Lucero on 10/1/20.
//

import Foundation

// ===============================================================
// ==== LAB 1 - computation.swift ========

func tip(subTotal: Double, tipPercentage: Double) -> Double {
        //Note That tipPercentage ranges from 0.0 to 1.0
    return (subTotal * (tipPercentage))
}
 
func taxes(subTotal: Double) -> Double{
    return (subTotal * 0.075)
}
 
 
func total(subTotal: Double, tipPercentage: Double) -> Double {
    return subTotal + tip(subTotal: subTotal, tipPercentage: tipPercentage) + taxes(subTotal : subTotal)
}

// ===============================================================
// ====== LAb 2 - steak files (order, steak, steak supply) =========

// Place code here

struct Order {
    
    var customerName : String
    var tableNumber : Int
    var orders : Int
    var preparedOrders :Int
    
  init(customerName: String , tableNumber: Int, orders: Int){
        self.customerName = customerName
        self.tableNumber = tableNumber
        self.orders = orders
        self.preparedOrders = 0
    }
    
    var status : String{
        
        if self.preparedOrders == self.orders {
            return "Complete"
        }else{
           return "In preparation"
        }
                
    }
    
}

// Place code here


struct Steak{
    
    var uncookedWeight: Double
    var internalTemperature: Double
        
    var doneness : String {
        
        switch internalTemperature{
        case 0..<125:
            return  "Uncooked"
        case 125..<135:
            return "Rare"
        case 135..<145:
            return  "Medium rare"
        case 145..<150:
            return  "Medium"
        case 150..<160:
            return "Medium well"
        case 160..<170:
            return "Well done"
        default:
            return "Burnt"
        }
        
    }
    
    var cookedWeight: Double {
        
        
        switch doneness{
        case "Uncooked":
            return uncookedWeight
        case "Rare":
            return 0.95*uncookedWeight
        case "Medium rare":
            return  0.90*uncookedWeight
        case "Medium":
            return 0.85*uncookedWeight
        case "Medium well":
            return 0.80*uncookedWeight
        case "Well done":
            return  0.75*uncookedWeight
        case "Burnt":
            return 0.70*uncookedWeight
        default:
            return uncookedWeight
        }
        
        
    }

    
    init(uncookedWeight: Double, internalTemperature: Double){
              self.uncookedWeight = uncookedWeight
              self.internalTemperature = internalTemperature
          }
    
    mutating func cook(){
        internalTemperature += 5;
    }
    
    
} //struct done

// Place code here

struct SteakSupply {
    
    var message : String
    var numSteaks : Int {
        willSet{
            if newValue < 20 {
                message = "Steak supply is low. You need to restock."
            }
        }
        didSet {
        if numSteaks > oldValue {
            let x = numSteaks - oldValue
            message = "Steak supply restocked with \(x) steaks."
            }
        }
        
    }
    
    
    
    init(numSteaks : Int){
        self.message = ""
        self.numSteaks = numSteaks
    }
    

}

// ===============================================================
// ====== LAB 3 - monthtext tests ========

@testable import MonthText

class MonthTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    // Provide your unit tests here
    // First condition to check is if the observed Month class has a property
    // called number. And considering if that test passes, then the follow-up test
    // would be to test if the default value for number is equal to 1. This tests
    // if an initializer function with no parameter list, exists in the Month
    // class:
    //   init() {
    //     number = 1
    //   }
    // Thus we can utilize the assert equal test from
    // https://developer.apple.com/documentation/xctest/2142776-xctassertequal

    func noInitValueTest() {
      let testMonth = Month();
      XCTAssertEqual(testMonth.number, 1);
    }

    // For my next unit tests, I will be testing for 2 things:
    // 1. if a property observer exists, if it does then it should determine
    // whether a number is set to a value outside of the [1,12] range.
    // 2. if the property observer, determines number is outside [1,12] range,
    // then it will set month.name property to "Invalid", and sets number property
    // equal to 1.

    func PropObservBelowRange()
    {
      let tMonth = Month(0);
      XCTAssertEqual(tMonth.number, 1, "number must be within range [1,12]");
      XCTAssertEqual(tMonth.name, "Invalid");
    }

    func PropObservAboveRange()
    {
        let tMonth = Month(13);
        XCTAssertEqual(tMonth.number, 1, "number must be within range [1,12]");
        XCTAssertEqual(tMonth.name, "Invalid");
    }
    
    func initComputedValueInRange() {
      let testMonth = Month(1);
      XCTAssertEqual(testMonth.number, 1);
      XCTAssertEqual(testMonth.name, "January");
    }

    // Next 2 things that can be tested:
    // 1. Test expected values of number; expected to be within a range [1,12]
    // 2. If number passes first test and is within range, then name property will
    // be tested to see if it is equal to expected month name string for
    // corresponding number.
    //      ex. if number = 3, name should be equal to "March", etc.

    func testExpectedValueRange() {
      let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      for index in 1...12 {
        let testMonth = Month(index);
        XCTAssertEqual(testMonth.number, index);
        XCTAssertEqual(testMonth.name, monthNames[index-1]);
      }
    }

    func initInputNotEqual() {
      let testMonth = Month(8);
      XCTAssertNotEqual(testMonth.number, 5);
      XCTAssertNotEqual(testMonth.name, "August");
    }
}


struct Month {
    
    
    init() {
        number = 1;
    }
    
    init(_ numberParam: Int) {
        number = numberParam;
    }
    
    var number : Int {
        didSet {
            if (number < 1 && number > 12) {
                number = oldValue;
            }
        }
    }
    
    var name: String {
        var monthName: String;
        switch number {
          case 1:
            monthName = "January";
          case 2:
            monthName = "February";
          case 3:
            monthName = "March";
          case 4:
            monthName = "April";
          case 5:
            monthName = "May";
          case 6:
            monthName = "June";
          case 7:
            monthName = "July";
          case 8:
            monthName = "August";
          case 9:
            monthName = "September";
          case 10:
            monthName = "October";
          case 11:
            monthName = "November";
          case 12:
            monthName = "December";
          default:
            monthName = "Invalid";
        }
        return monthName;
    }
}


// ===============================================================
// ====== LAB 4 - Apple pie, light ========

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }

}

// ===============================================================
// ====== LAB 5 - GroceryCart ========

struct Cart {

    var items: [String: Int]

    var totalItems: Int
    {
        let numItems = Array(items.values)
        var amt = 0
        
        for num in numItems
        {
            amt += num
        }
        return amt
    }

    var printOut: String
    {
        var itemList = ""
        for (name, quantity) in items
        {
            itemList += "\(name): \(quantity)\n"
        }
        return itemList
    }

    init()
    {
        items = [:]
    }

    mutating func add(_ name: String, quantity: Int)
    {
        if let nameOfItem = items[name] {
            items[name] = nameOfItem + quantity
        } else {
            items[name] = quantity
        }
    }
}
