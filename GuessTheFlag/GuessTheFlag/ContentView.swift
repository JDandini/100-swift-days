//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Javier Castañeda on 18/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US"
    ]
    private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea()
            VStack {
                Text("Tap the flag of")
                    .foregroundStyle(.white)
                Text(countries[correctAnswer])
                    .foregroundStyle(.white)
                ForEach(0 ..< 2) { number in
                    Button {
                        //action
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
        
    }
    
    private func executeDelete() {
        print("Now deleting")
    }
}

#Preview {
    ContentView()
}
