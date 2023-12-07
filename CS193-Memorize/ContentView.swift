//
//  ContentView.swift
//  Memorize
//
//  Created by Steve Schauer on 12/03/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "👿", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @State var cardCount: Int = 6
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.bold)
            ScrollView {
                cards
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 :0)
            base.fill().opacity(isFaceUp ? 0 : 1)
                .onTapGesture {
                    isFaceUp.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
