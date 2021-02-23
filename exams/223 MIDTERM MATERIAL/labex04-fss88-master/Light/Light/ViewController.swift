//
//  ViewController.swift
//  Light
//
//  Created by Fahad Alswailem on 9/25/20.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }
    
    func updateUI(){
        view.backgroundColor = lightOn ? .white : .black
    }
    



}

