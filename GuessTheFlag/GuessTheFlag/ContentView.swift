//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Javier Castañeda on 18/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Button 1"){}
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive){}
                .buttonStyle(.bordered)
            Button("Button 3"){}
                .buttonStyle(.borderedProminent)
                .tint(.teal)
            Button("Button 4", role: .destructive){}
                .buttonStyle(.borderedProminent)
        }
    }
    
    private func executeDelete() {
        print("Now deleting")
    }
}

#Preview {
    ContentView()
}
