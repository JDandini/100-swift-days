//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Javier Castañeda on 23/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello world")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.yellow)
            .padding()
            .background(.orange)
    }
}

#Preview {
    ContentView()
}
