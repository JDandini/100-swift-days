//
//  ContentView.swift
//  WeSplit
//
//  Created by Javier Castañeda on 17/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        NavigationStack {
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
            }
        }
    }
}

#Preview {
    ContentView()
}
