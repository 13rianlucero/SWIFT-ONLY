
import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    
    let images = [#imageLiteral(resourceName: "dimond2"),#imageLiteral(resourceName: "crown2-1"),#imageLiteral(resourceName: "bar2-1"),#imageLiteral(resourceName: "seven2-1"),#imageLiteral(resourceName: "cherry2-1"),#imageLiteral(resourceName: "lemon2-1")]
    
    @IBOutlet weak var machineImageView: UIImageView!                 //Top part of the slot machine image
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var barImageView: UIImageView!    //image of handle to "pull"
    @IBOutlet weak var userIndicatorlabel: UILabel!  // Label used to say you won or lost
    @IBOutlet weak var cashImageView: UIImageView! // image of cash bottom right
    @IBOutlet weak var cashToRiskLabel: UILabel! // number$ in the bottom right
    @IBOutlet weak var stepper: UIStepper! // to used to raise or lower bet
    
    @IBAction func cancelBtnAxn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        stepper.maximumValue = Double(currentCash) // sets the max val of stepper to amount of cash the player has
        let amount = Int(sender.value) //gets value from the stepper
        if currentCash >= amount{ // if said amount is less than currentCash, allows the bet
            cashToRisk = amount  // sets the bet amount to amount
            cashToRiskLabel.text = "\(amount)$"  // updates the label to let the user know how much cash is on the line
        }
    }
    
    @IBOutlet weak var cashLabel: UILabel! // label to show how much cash you have
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()// gets cashLabel set up depending if it's their first game or not
        
        // swipeDown GestureRecognizer, for the "pull" action by the user
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    // Bet amount
    var cashToRisk : Int = 10{
        didSet{//update ui
            cashToRiskLabel.text = "\(currentCash)$"
        }
    }
    
    // get current displayed cash, remove '$'
    var currentCash : Int{
        guard let cash = cashLabel.text, !(cashLabel.text?.isEmpty)! else {
            return 0
        }
        return Int(cash.replacingOccurrences(of: "$", with: ""))!
    }
    
    func startGame(){
        if Model.instance.isFirstTime(){ // check if it's first time playing
            Model.instance.updateScore(label: cashLabel, cash: 500)
        }else{ // get last saved score
            cashLabel.text = "\(Model.instance.getScore())$"
        } // set max bet
        stepper.maximumValue = Double(currentCash)
    }
    
    func roll(){ // roll pickerview
        var delay : TimeInterval = 0
        // iterate over each component, set random img
        for i in 0..<pickerView.numberOfComponents{
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                self.randomSelectRow(in: i)
            })
            delay += 0.30
        }
    }
    
    // get random number
    func randomSelectRow(in comp : Int){
        let r = Int(arc4random_uniform(UInt32(8 * images.count))) + images.count
        pickerView.selectRow(r, inComponent: comp, animated: true)
        
    }
    
    
    func checkWin(){
        
        var lastRow = -1
        var counter = 0
        
        for i in 0..<pickerView.numberOfComponents{
            let row : Int = pickerView.selectedRow(inComponent: i) % images.count // selected img idx
            if lastRow == row{ // two equals indexes
                counter += 1
            } else {
                lastRow = row
                counter = 1
            }
        }
        
        if counter == 3{ // winning
            Model.instance.play(sound: Constant.win_sound)
            animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
            animate(view: cashImageView, images: [#imageLiteral(resourceName: "change"),#imageLiteral(resourceName: "extra_change")], duration: 1, repeatCount: 15)
            stepper.maximumValue = Double(currentCash)

            userIndicatorlabel.text = "YOU WON \(200 + cashToRisk * 2)$"
            Model.instance.updateScore(label: cashLabel,cash: (currentCash + 200) + (cashToRisk * 2))
        } else { // losing
            userIndicatorlabel.text = "TRY AGAIN"
            Model.instance.updateScore(label: cashLabel,cash: (currentCash - cashToRisk))
        }
        
        // if cash is over
        if currentCash <= 0 {
            gameOver()
        }else{  // update bet stepper
            if Int(stepper.value) > currentCash {
                stepper.maximumValue = Double(currentCash)
                cashToRisk = currentCash
                stepper.value = Double(currentCash)
            }
        }
    }
    
    func gameOver(){ // when game is over, show alert
        let alert = UIAlertController(title: "Game Over", message: "You have \(currentCash)$ \nPlay Again?", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.startGame()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // when spining
    @IBAction func spinBarAction(_ sender: UITapGestureRecognizer) {
        spinAction()
    }
    
    func spinAction(){
        barImageView.isUserInteractionEnabled = false // disable clicking
        // animation of bandit handle
        animate(view: barImageView, images: #imageLiteral(resourceName: "mot").spriteSheet(cols: 14, rows: 1), duration: 0.5, repeatCount: 1)
        userIndicatorlabel.text = ""
        Model.instance.play(sound: Constant.spin_sound)
        roll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.checkWin()
            self.barImageView.isUserInteractionEnabled = true
        }
        
    }

    
    //MARK: - UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count * 10
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let index = row % images.count
        return UIImageView(image: images[index])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return images[component].size.height + 1
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.down: self.spinAction()
            default:break
            }
        }
    }
}
