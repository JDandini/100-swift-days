//
//  ContentView.swift
//  Animations
//
//  Created by Javier Castañeda on 26/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        Button("Tap me!") {
            animationAmount += 1
        }
        .padding(50)
        .background(.teal)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .animation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
            value: animationAmount
        )
        .onAppear {
            animationAmount = 2
        }

    }
}

#Preview {
    ContentView()
}
