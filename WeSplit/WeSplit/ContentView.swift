//
//  ContentView.swift
//  WeSplit
//
//  Created by Javier Castañeda on 17/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationTitle("Swift UI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
