//
//  ContentView.swift
//  MemorizeRecap
//
//  Created by Apostol, Alexandru on 21/09/2020.
//  Copyright © 2020 Apostol, Alexandru. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var model: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(model.cards) { card  in
                CardView(card: card, font: self.model.font)
                    .onTapGesture {
                        self.model.chooseCard(card: card)
                }
                  .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var font: Font
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content).font(font)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: EmojiMemoryGame())
    }
}
