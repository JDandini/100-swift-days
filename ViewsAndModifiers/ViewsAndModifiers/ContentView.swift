//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Javier Castañeda on 23/06/26.
//

import SwiftUI

struct ContentView: View {
   private let motto1 = Text("Draco dormiens")
   private let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack {
            Text("Hello world!")
                .titleStyle()
            
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
        }
        .padding()
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    func watermarked(with text: String) -> some View {
           modifier(Watermark(text: text))
    }
}
#Preview {
    ContentView()
}
