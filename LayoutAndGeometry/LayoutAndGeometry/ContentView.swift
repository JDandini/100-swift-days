//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Javier Castañeda on 31/08/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .offset(x: 100, y: 100)
            .background(.red)
    }
}

#Preview {
    ContentView()
}
