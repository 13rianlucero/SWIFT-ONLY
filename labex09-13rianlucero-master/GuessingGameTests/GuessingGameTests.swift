//
//  GuessingGameTests.swift
//  GuessingGameTests
//
//  Created by Paul Inventado on 10/21/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

@testable import GuessingGame
import XCTest

class GuessingGameTests: XCTestCase {
    func testProtocol() {
        var testInstance: Guessable = EvenNumbers()
        _ = testInstance.getClue()
        _ = testInstance.guess("")
    }
    
    func testGameDefaultInit() {
        _ = Game()
    }
    
    func testGameSaveFile() {
        var testGame = Game()
        var history = GameHistory()
        history.games.append(3)
        history.games.append(6)
        testGame.history = history
        testGame.save()
        
        let gameDecoder = PropertyListDecoder()
        guard let saveLocation = FileManager.default.urls(for: .documentDirectory,
                                                          in: .userDomainMask).first
        else {
            XCTFail()
            return
        }
        let fileURL = saveLocation.appendingPathComponent("game").appendingPathExtension("plist")
        guard let gameFile = try? Data(contentsOf: fileURL), let decodedHistory = try? gameDecoder.decode(GameHistory.self, from: gameFile) else {
            XCTFail()
            return
        }
        XCTAssertEqual(history.games, decodedHistory.games)
    }
    
    func testGameLoadFile() {
        var history = GameHistory()
        history.games.append(3)
        history.games.append(6)
        
        let gameEncoder = PropertyListEncoder()
        guard let saveLocation = FileManager.default.urls(for: .documentDirectory,
                                                          in: .userDomainMask).first, let encodedHistory = try? gameEncoder.encode(history)
        else {
            return
        }
        let fileURL = saveLocation.appendingPathComponent("game").appendingPathExtension("plist")
        try? encodedHistory.write(to: fileURL)
        
        let testGame = Game()
        XCTAssertEqual(testGame.history.games, history.games)
    }
    
    func testNewGuessable() {
        let testGame = Game()
        var hasNewGuessable = false
        for _ in 1 ... 30 {
            var generator = testGame.getGenerator()
            switch generator {
            case is EvenNumbers: continue
            case is RainbowColors: continue
            default:
                _ = generator.getClue()
                _ = generator.guess("")
                hasNewGuessable = true
            }
        }
        XCTAssertTrue(hasNewGuessable)
    }
}
