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
    
    
    func choose(card: Card) {
        print("Card Chose \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardContent =  cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: true, isMatched: false, content: cardContent))
            cards.append(Card(isFaceUp: true, isMatched: false, content: cardContent))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: String {
            return UUID().uuidString
        }
        
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
