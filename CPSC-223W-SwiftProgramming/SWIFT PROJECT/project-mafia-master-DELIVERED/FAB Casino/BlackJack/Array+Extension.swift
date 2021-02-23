//
//  Array+Extension.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import Foundation

// Shuffle the cards. Keyword extention: is used to extend the fancionality of a class.
extension Array {
    mutating func shuffle() {
        if count < 2 { return }
        for i in 0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}
