//
//  BlackJackViewController.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

// global variables
var SKViewSize: CGSize?
var SKViewSizeRect: CGRect?

// Class managing visual elements and user interactions (assets)
class BlackJackViewController: UIViewController {
    //loadview is called when the view is loaded.
    override func loadView() {
        self.view = SKView.init(frame: UIScreen.main.bounds)
    }
    //viewDidLoad is called after the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialise BlackJack Scene according to View
        if let skView = self.view as? SKView{
            SKViewSize = skView.bounds.size
            let scene = BlackJackScene(size: SKViewSize!)
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
            SKViewSizeRect = getViewSizeRect()
        }
        //Add X button to go to previus screen
        let button = UIButton(frame: CGRect(x: self.view.frame.width - 100, y: 0, width: 100, height: 60))
        button.setTitle("X", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(self.cancel), for: .touchUpInside)
        self.view.addSubview(button)
    }
    //Go to previous screen.
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    //this function is called when the layout is created or changes (updates)
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SKViewSize = self.view.bounds.size
        SKViewSizeRect = getViewSizeRect()
        //change screen size
        let skView = self.view as! SKView
        if let scene = skView.scene {
            if scene.size != self.view.bounds.size {
                scene.size = self.view.bounds.size
            }
        }
    }
    
    // get RECT
    func getViewSizeRect() -> CGRect {
        return CGRect(x: ((SKViewSize!.width  * 0.5) * -1.0), y: ((SKViewSize!.height * 0.5) * -1.0), width: SKViewSize!.width, height: SKViewSize!.height)
    }
    
    //to hide the status bar.
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
