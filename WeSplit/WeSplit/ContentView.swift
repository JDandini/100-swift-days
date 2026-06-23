//
//  ContentView.swift
//  WeSplit
//
//  Created by Javier Castañeda on 17/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool
    
    private let locale = Locale.current.currency?.identifier ?? "USD"
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return grandTotal / peopleCount
    }
    
    private var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount * tipSelection / 100
        let total = checkAmount + tipValue
        return total
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(code:locale)
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< 101) {
                            Text("\($0) %")
                                .foregroundStyle($0 == 0 ? .red : .secondary)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("How much tip do you want to leave?")
                }
            
                Section {
                    Text(
                        totalPerPerson,
                        format: .currency(code: locale)
                    )
                } header: {
                    Text("Total per person")
                }
                
                Section {
                    Text(
                        grandTotal,
                        format: .currency(code: locale)
                    )
                } header: {
                    Text("Total amount to pay")
                }
            }
            .navigationTitle("We Split")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
