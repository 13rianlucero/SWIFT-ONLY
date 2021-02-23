//
//  Month.swift
//  Month
//
//  Created by Paul Inventado on 9/14/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import Foundation;

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
                number = 1;
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
};
