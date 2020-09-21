//
//  ContentView.swift
//  MemorizeRecap
//
//  Created by Apostol, Alexandru on 21/09/2020.
//  Copyright © 2020 Apostol, Alexandru. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4, content: {_ in
                CardView(isFAceUp: true)
            })
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}

struct CardView: View {
    var isFAceUp: Bool
    var body: some View {
        ZStack {
            if isFAceUp {
            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
            Text("👻").font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
