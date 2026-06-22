//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Javier Castañeda on 18/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
        Button("Show alert") {
            showAlert = true
        }.alert("Important message", isPresented: $showAlert) {
            Button("OK") {
                showAlert = false
            }
        } message: {
            Text("Please read this message")
        }
    }
    
    private func executeDelete() {
        print("Now deleting")
    }
}

#Preview {
    ContentView()
}
