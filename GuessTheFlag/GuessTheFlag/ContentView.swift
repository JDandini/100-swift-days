//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Javier Castañeda on 18/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("Button tapped")
        } label: {
            Text("Tap me!")
                .padding()
                .foregroundStyle(.white)
                .background(.teal)
        }
    }
    
    private func executeDelete() {
        print("Now deleting")
    }
}

#Preview {
    ContentView()
}
