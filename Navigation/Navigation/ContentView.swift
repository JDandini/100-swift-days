//
//  ContentView.swift
//  Navigation
//
//  Created by Javier Castañeda on 03/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack {
            Text("Hello, world!")
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Tap Me") {
                        // button action here
                    }

                    Button("Tap Me 2") {
                        // button action here
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
