//
//  SlotMachineViewModel.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SlotMachineViewModel {
    
    let images = [#imageLiteral(resourceName: "dimond2"),#imageLiteral(resourceName: "crown2-1"),#imageLiteral(resourceName: "bar2-1"),#imageLiteral(resourceName: "seven2-1"),#imageLiteral(resourceName: "cherry2-1"),#imageLiteral(resourceName: "lemon2-1")]
    var player : AVAudioPlayer?
    
    // update user score
    func updateScore(cash amount : Int){
        UserDefaults.standard.set(amount, forKey: Constant.user_cash)
    }
    
    // get last saved score
    func getScore() -> Int{
        return UserDefaults.standard.integer(forKey: Constant.user_cash)
//        return cash <= 0 ? 500 : cash
    }
    
    // check if it's first time playing
    func isFirstTime() -> Bool{
        let saveExist = UserDefaults.standard.bool(forKey: Constant.is_save_exist)
        if !saveExist{
            UserDefaults.standard.set(true, forKey: Constant.is_save_exist)
            return true
        }
        return false
    }
    
    // play sound
    func play(sound name : String){
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else{
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
    func getImagesCount() -> Int {
        return images.count
    }
    
    func getImage(tag: Int)-> UIImage{
        if tag >= 0 && tag < images.count {
          return images[tag]
        }
        return images[0]
    }
    
    func getRandomNumber()-> Int{
        return Int(arc4random_uniform(UInt32(8 * self.getImagesCount()))) + self.getImagesCount()
    }
    
}
