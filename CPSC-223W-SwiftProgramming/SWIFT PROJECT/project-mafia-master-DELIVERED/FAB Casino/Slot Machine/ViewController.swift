//
//  ViewController.swift
//  CasinoGame
//
//  Created by Brian on 10/30/20.
//  Copyright © 2020 Brian Lucero. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

// ------------------------------
// -- ViewContoller Code Block --
// ------------------------------
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let vm = SlotMachineViewModel()
    @IBOutlet var machineImageView: UIImageView! // Top part of the slot machine image
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var barImageView: UIImageView! // image of handle to "pull"
    @IBOutlet var userIndicatorlabel: UILabel! // Label used to say you won or lost
    @IBOutlet var cashImageView: UIImageView! // image of cash bottom right
    @IBOutlet var cashToRiskLabel: UILabel! // number$ in the bottom right
    @IBOutlet var stepper: UIStepper! // to used to raise or lower bet
    
    @IBAction func cancelBtnAxn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        stepper.maximumValue = Double(currentCash) // sets the max val of stepper to amount of cash the player has
        let amount = Int(sender.value) // gets value from the stepper
        if currentCash >= amount { // if said amount is less than currentCash, allows the bet
            cashToRisk = amount // sets the bet amount to amount
            cashToRiskLabel.text = "\(amount)$" // updates the label to let the user know how much cash is on the line
        }
    }
    
    @IBOutlet var cashLabel: UILabel! // label to show how much cash you have
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame() // gets cashLabel set up depending if it's their first game or not
        
        // swipeDown GestureRecognizer, for the "pull" action by the user
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeDown)
    }
    
    // Bet amount
    var cashToRisk: Int = 10 {
        didSet { // update ui
            cashToRiskLabel.text = "\(currentCash)$"
        }
    }
    
    // get current displayed cash, remove '$'
    var currentCash: Int {
        guard let cash = cashLabel.text, !(cashLabel.text?.isEmpty)! else {
            return 0
        }
        return Int(cash.replacingOccurrences(of: "$", with: ""))!
    }
    
    func startGame() {
        if vm.isFirstTime() { // check if it's first time playing
            cashLabel.text = "500"
            vm.updateScore(cash: 500)
        } else { // get last saved score
            cashLabel.text = "\(vm.getScore())$"
        } // set max bet
        stepper.maximumValue = Double(currentCash)
    }
    
    func roll() { // roll pickerview
        var delay: TimeInterval = 0
        // iterate over each component, set random img
        for i in 0..<pickerView.numberOfComponents {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.randomSelectRow(in: i)
            }
            delay += 0.30
        }
    }
    
    // get random number
    func randomSelectRow(in comp: Int) {
        pickerView.selectRow(vm.getRandomNumber(), inComponent: comp, animated: true)
    }
    
    func checkWin() {
        var lastRow = -1
        var counter = 0
        
        for i in 0..<pickerView.numberOfComponents {
            let row: Int = pickerView.selectedRow(inComponent: i) % vm.getImagesCount() // selected img idx
            if lastRow == row { // two equals indexes
                counter += 1
            } else {
                lastRow = row
                counter = 1
            }
        }
        
        if counter == 3 { // winning
            vm.play(sound: Constant.win_sound)
            animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"), #imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
            animate(view: cashImageView, images: [#imageLiteral(resourceName: "change"), #imageLiteral(resourceName: "extra_change")], duration: 1, repeatCount: 15)
            stepper.maximumValue = Double(currentCash)
            let amount = (currentCash + 200) + (cashToRisk * 2)
            cashLabel.text = "\(amount)"
            vm.updateScore(cash: -amount)
            userIndicatorlabel.text = "YOU WON \(200 + cashToRisk * 2)$"
        } else { // losing
            userIndicatorlabel.text = "TRY AGAIN"
            let amount = (currentCash - cashToRisk)
            cashLabel.text = "\(amount)"
            vm.updateScore(cash: amount)
        }
        
        // if cash is over
        if currentCash <= 0 {
            gameOver()
        } else { // update bet stepper
            if Int(stepper.value) > currentCash {
                stepper.maximumValue = Double(currentCash)
                cashToRisk = currentCash
                stepper.value = Double(currentCash)
            }
        }
    }
    
    func gameOver() { // when game is over, show alert
        let alert = UIAlertController(title: "Game Over", message: "You have \(currentCash)$ \nPlay Again?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.startGame()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    // when spining
    @IBAction func spinBarAction(_ sender: UITapGestureRecognizer) {
        spinAction()
    }
    
    func spinAction() {
        if vm.getScore() >= cashToRisk {
            barImageView.isUserInteractionEnabled = false // disable clicking
            // animation of bandit handle
            animate(view: barImageView, images: #imageLiteral(resourceName: "mot").spriteSheet(cols: 14, rows: 1), duration: 0.5, repeatCount: 1)
            userIndicatorlabel.text = ""
            vm.play(sound: Constant.spin_sound)
            roll()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.checkWin()
                self.barImageView.isUserInteractionEnabled = true
            }
        }
    }

    // MARK: - UIPickerView

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vm.getImagesCount() * 10
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let index = row % vm.getImagesCount()
        return UIImageView(image: vm.getImage(tag: index))
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return vm.getImage(tag: component).size.height + 1
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.down: spinAction()
            default: break
            }
        }
    }
} // -- END of ViewContoller Code Block --

// -------------------------------------------------------------
// -- adding some code extensions to some of the UI features: --
// -------------------- Utils.swift ----------------------------
// -------------------------------------------------------------

// defines some constant variables that will not have values that change.
enum Constant {
    static let user_cash: String = "cash"
    static let win_sound: String = "win"
    static let spin_sound: String = "spin"
    static let is_save_exist: String = "save_exist"
}

extension UIViewController {
    func animate(view: UIImageView, images: [UIImage], duration: TimeInterval, repeatCount: Int) {
        view.animationImages = images
        view.animationDuration = duration
        view.animationRepeatCount = repeatCount
        view.startAnimating()
    }
}

extension UIImage {
    func spriteSheet(cols: UInt, rows: UInt) -> [UIImage] {
        let w = size.width / CGFloat(cols)
        let h = size.height / CGFloat(rows)
        
        var rect = CGRect(x: 0, y: 0, width: w, height: h)
        var arr: [UIImage] = []
        
        for _ in 0..<rows {
            for _ in 0..<cols {
                // crop
                let subImage = crop(rect)
                // add to array
                arr.append(subImage)
                
                // go to next image in row
                rect.origin.x += w
            }
            
            // go to next row
            rect.origin.x = 0
            rect.origin.y += h
        }
        
        // done, return the array
        return arr
    }
    
    func crop(_ rect: CGRect) -> UIImage {
        guard let imageRef = cgImage?.cropping(to: rect) else {
            return UIImage()
        }
        return UIImage(cgImage: imageRef)
    }
}
