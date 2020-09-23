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
        let emojis = ["👻","🎃","😈","💀"]
    let randomNumber = Int.random(in: 1..<emojis.count)
    return MemoryGame<String>(numberOfPairsOfCards: randomNumber) { pairIndx in
            emojis[pairIndx]
        }
    }
    
    var font: Font {
        if cards.count == 10 {
            return Font.largeTitle
        } else {
            return Font.title
        }
    }
    
    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
