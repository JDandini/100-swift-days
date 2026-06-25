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
    @State private var wakeUp = defaultWakeTime
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    DatePicker(
                        "Please enter a time",
                        selection: $wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                }
                
                Section {
                    Stepper(
                        "\(sleepAmount.formatted()) hours",
                        value: $sleepAmount,
                        in: 4...12,
                        step: 0.25
                    )
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
                
                Section {
                    Picker("Coffe intake", selection: $coffeeAmount) {
                        ForEach(0 ..< 21) {
                            Text( "^[\($0) cup](inflect: true)")
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
                
                Section {
                    HStack {
                        Spacer()
                        Text(alertMessage)
                            .largeTitle()
                        Spacer()
                    }
                        
                } header: {
                    Text("Recommended bedtime")
                        .font(.headline)
                }
            }
            .navigationTitle("Better Sleep")
        }
        .onAppear(perform: calculateBedTime)
        .onChange(of: wakeUp, calculateBedTime)
        .onChange(of: sleepAmount, calculateBedTime)
        .onChange(of: coffeeAmount, calculateBedTime)
       
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
        let components = Calendar.current.dateComponents(
            [.hour, .minute],
            from: wakeUp
        )
        let hour = Double(components.hour ?? 0) * 60 * 60
        let minute = Double(components.minute ?? 0) * 60
        return hour + minute
    }
}

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(.teal)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func largeTitle() -> some View {
        self.modifier(LargeTitle())
    }
}

#Preview {
    ContentView()
}
