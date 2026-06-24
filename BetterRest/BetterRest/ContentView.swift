//
//  ContentView.swift
//  BetterRest
//
//  Created by Javier Castañeda on 23/06/26.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount: Double = 8.0
    @State private var coffeeAmount: Int = 1
    @State private var wakeUp = Date.now
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
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
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK"){}
            } message: {
                Text(alertMessage)
            }
        }
       
    }
    
    private func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try BetterRestML(configuration: config)
            let wakeTime = getWakeAsDouble()
            let coffeeAsDouble = Double(coffeeAmount)
            let prediction = try model.prediction(
                wake: wakeTime,
                estimatedSleep: sleepAmount,
                coffee: coffeeAsDouble
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        }catch {
            // something went wrong
            alertTitle = "Error"
            alertMessage = "Sorry was a problem calculating your bedtime"
        }
        
        showAlert = true
    }
    
    private func getWakeAsDouble() -> Double {
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = Double(components.hour ?? 0) * 60 * 60
        let minute = Double(components.minute ?? 0) * 60
        return hour + minute
    }
}

#Preview {
    ContentView()
}
