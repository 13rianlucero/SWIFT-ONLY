//
//  Hand.swift
//  FAB Casino
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//
import Foundation

//The game hand, 1 with each player, with the cards in them
class Hand {
    private var hand = [Card]()
    
    func addCard(card: Card){
        hand.append(card)
    }
    
    func resetHand(){
        hand.removeAll()
    }
    
    func getHandValue()->Int{
        var handValue = 0;
        var hasAceInHand=false;
        
        for card in hand {
            var cardsValue =  card.getCardValue()
            if (cardsValue > 10){
                cardsValue = 10;
            }
            
            handValue += cardsValue
            
            if (cardsValue == 1){
                hasAceInHand = true
            }
        }
        if (hasAceInHand && handValue <= 11){
            handValue += 10
        }
        
        return handValue;
    }
    
    func getHandLength()-> Int{
        return hand.count
    }
    
}
