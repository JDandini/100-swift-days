//
//  ContentView.swift
//  Instafilter
//
//  Created by Javier Castañeda on 22/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello, World!") {
            showingConfirmation = true
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Teal") { backgroundColor = .teal }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")
        }
    }
}


#Preview {
    ContentView()
}
