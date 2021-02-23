//
//  Deck.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//
import Foundation
//Contains all the cards.
//Suits: d h s c, Values 1...13.
class Deck {
    private var deck = [Card]()
    private var deckIndex = -1
    
    init() {
        setUpDeck()
    }
    
    func setUpDeck(){
        for cardSuit in ["d","h","s","c"] {
            for cardValue in 1...13 {
                let tempCard = Card(suit: cardSuit, value: cardValue)
                deck.append(tempCard)
            }
        }
    }

    func getTopCard()->Card{
        deckIndex += 1
        return deck[deckIndex]
    }
    
    func shuffleCards(){
        deck.shuffle()
    }
    
    func resetDeck(){
        deckIndex = -1
        shuffleCards()
    }
}
