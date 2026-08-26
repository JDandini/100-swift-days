//
//  ContentView.swift
//  Flashzilla
//
//  Created by Javier Castañeda on 25/08/26.
//

import SwiftUI

struct ContentView: View {
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }

    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

#Preview {
    ContentView()
}
