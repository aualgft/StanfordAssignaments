//
//  EmojiMemoryGame.swift
//  MemorizeRecap
//
//  Created by Apostol, Alexandru on 22/09/2020.
//  Copyright © 2020 Apostol, Alexandru. All rights reserved.
//

import SwiftUI



class EmojiMemoryGame {
    private  var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
   static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃"]
    return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndx in
            emojis[pairIndx]
        }
    }
    
    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
