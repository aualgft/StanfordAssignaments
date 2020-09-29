//
//  EmojiMemoryGame.swift
//  MemorizeRecap
//
//  Created by Apostol, Alexandru on 22/09/2020.
//  Copyright © 2020 Apostol, Alexandru. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private  var model: MemoryGame<String> = createMemoryGame()
    private var emojis: Theme? = Theme.halowen

    
    static func createMemoryGame(emojis: [String]? = Theme.halowen.theme ) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: emojis!.count) { pairIndx in
            emojis![pairIndx]
        }
    }
    
    // MARK: ACCES TO THE MODEL
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var title: String {
        return emojis!.name
    }
    
    var color: Color {
        return emojis!.color
    }
    
    var points: Int {
        return model.points
    }
    
    // MARK: INTENTS
    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        emojis = Theme.allCases.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(emojis: emojis?.theme)
    }
}



enum Theme: CaseIterable {
    case faces
    case animals
    case cars
    case halowen
    
    var theme: [String]{
        switch self {
        case .faces:
            return ["👶","👧","👩"]
        case .animals:
            return ["🐨","🐶","🐭"]
        case .cars:
            return ["🚗","🚕","🚙"]
        case .halowen:
            return ["👻","🎃","😈"]
        }
    }
    
    var name: String {
        switch self {
        case .faces:
            return "Faces"
        case .animals:
            return "Animals"
        case .cars:
            return "Cars"
        case .halowen:
            return "Halloween"
        }
    }
    
    var color: Color {
        switch self {
        case .faces:
            return Color.blue
        case .animals:
            return Color.green
        case .cars:
            return Color.red
        case .halowen:
            return Color.orange
        }
    }
}


