//
//  ViewController.swift
//  GuessingGame
//
//  Created by Paul Inventado on 10/21/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gamesPlayedLabel: UILabel!
    @IBOutlet var averageCluesLabel: UILabel!
    @IBOutlet var cluesThisRoundLabel: UILabel!
    @IBOutlet var clueLabel: UILabel!
    @IBOutlet var guessTextField: UITextField!
    var game: Game!
    var generator: Guessable!
    var clueCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game()
        restartGame()
        // Do any additional setup after loading the view.
    }
    
    func restartGame() {
        generator = game.getGenerator()
        clueCount = 0
        refreshStats()
    }
    
    func refreshStats() {
        cluesThisRoundLabel.text = String(clueCount)
        gamesPlayedLabel.text = String(game.history.gamesPlayed)
        averageCluesLabel.text = String(game.history.averageClues)
    }
    @IBAction func getCluePressed(_ sender: Any) {
        clueLabel.text = generator.getClue()
        clueCount += 1
        refreshStats()
    }
    @IBAction func makeGuessPressed(_ sender: Any) {
        if generator.guess(guessTextField.text!) {
            game.history.games.append(clueCount)
            restartGame()
            guessTextField.text = "Right"
        } else {
            guessTextField.text = "Wrong"
        }
    }
    @IBAction func saveGamePressed(_ sender: Any) {
        game.save()
    }
    @IBAction func resetGamePressed(_ sender: Any) {
        game.reset()
        refreshStats()
    }
    

}

