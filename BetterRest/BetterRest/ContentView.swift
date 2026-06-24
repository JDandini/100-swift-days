//
//  ContentView.swift
//  BetterRest
//
//  Created by Javier Castañeda on 23/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount: Double = 8.0
    @State private var coffeeAmount: Int = 1
    @State private var wakeUp = Date.now
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker(
                    "Please enter a time",
                    selection: $wakeUp,
                    displayedComponents: .hourAndMinute
                )
                .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper(
                    "\(sleepAmount.formatted()) hours",
                    value: $sleepAmount,
                    in: 4...12,
                    step: 0.25
                )
                
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper(
                    "\(coffeeAmount) cups",
                    value: $coffeeAmount,
                    in: 0...20,
                )
                
            }
            .padding()
            .navigationTitle("Better Sleep")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
        }
       
    }
    
    func calculateBedTime() {
        
    }
    
}

#Preview {
    ContentView()
}
