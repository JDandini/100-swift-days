//
//  ContentView.swift
//  Flashzilla
//
//  Created by Javier Castañeda on 25/08/26.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(.rect)
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    ContentView()
}
