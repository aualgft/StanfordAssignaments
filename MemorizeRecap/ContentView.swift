//
//  ContentView.swift
//  MemorizeRecap
//
//  Created by Apostol, Alexandru on 21/09/2020.
//  Copyright © 2020 Apostol, Alexandru. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var model: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(model.cards) { card  in
                CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        self.model.chooseCard(card: card)
                }
            }
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize ) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.lineWidth)
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .font(Font.system(size: min(size.width, size.height) * self.fontMultiplier))
    }
    
    // MARK: Drawing Constants
    var cornerRadius: CGFloat = 10.0
    var fontMultiplier: CGFloat = 0.75
    var lineWidth: CGFloat = 3.0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: EmojiMemoryGame())
    }
}
