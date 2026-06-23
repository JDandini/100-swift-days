//
//  ContentView.swift
//  BetterRest
//
//  Created by Javier Castañeda on 23/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    var body: some View {
        VStack {
            DatePicker(
                "Please enter a date",
                selection: $wakeUp,
                in: Date.now...
            )
            .labelsHidden()
            Stepper(
             "\(sleepAmount.formatted()) hours",
             value: $sleepAmount,
             in: 4...12,
             step: 0.25
            )
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
