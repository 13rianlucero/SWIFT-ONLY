//
//  Croupier.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//
import Foundation

// The dealer.
class Croupier: BasePlayer {
    private var card = Card(suit: "cardFront", value: 0)

    func setCard(card: Card) {
        self.card = card
    }

    func getCard() -> Card {
        return card
    }
}
