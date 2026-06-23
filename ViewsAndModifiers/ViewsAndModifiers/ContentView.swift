//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Javier Castañeda on 23/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.teal)
    }
}

#Preview {
    ContentView()
}
