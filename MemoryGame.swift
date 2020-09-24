//
//  MemoryGame.swift
//  MemorizeRecap
//
//  Created by Apostol, Alexandru on 22/09/2020.
//  Copyright © 2020 Apostol, Alexandru. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card Chose \(card)")
        if let index = chosenIndex(of: card) {
        cards[index].isFaceUp = !cards[index].isFaceUp
        }
    }
    
    func chosenIndex(of card: Card) -> Int? {
        for index in 0..<self.cards.count {
            if card.id == self.cards[index].id {
                return index
            }
        }
        return nil
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardContent =  cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, isFaceUp: true, isMatched: false, content: cardContent))
            cards.append(Card(id: pairIndex*2+1, isFaceUp: true, isMatched: false, content: cardContent))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
