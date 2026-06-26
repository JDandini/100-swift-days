//
//  ContentView.swift
//  Animations
//
//  Created by Javier Castañeda on 26/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false

    var body: some View {
        Button("Tap Me") {
            // do nothing
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(nil, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 0.5, bounce: 0.8), value: enabled)

    }
}

#Preview {
    ContentView()
}
