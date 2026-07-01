//
//  AddExpenseVIew.swift
//  iExpense
//
//  Created by Javier Castañeda on 01/07/26.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount: Double = 0.0
    @State private var showAlert: Bool = false

    let types = ["Business", "Personal"]
    var expenses: Expenses

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField(
                    "Amount",
                    value: $amount,
                    format: .currency(code: "USD")
                )
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save", action: saveExpense)
            }
            .alert("Addition error", isPresented: $showAlert) {
                
            } message: {
                Text("The amount should be greater than 0 and the name can not be empty")
            }
        }
    }

    private func saveExpense() {
        guard !name.isEmpty, amount > 0 else {
            showAlert = true
            return
        }
        let expense = ExpenseItem(name: name, type: type, amount: amount)
        expenses.items.append(expense)
        dismiss()
    }
}

#Preview {
    AddExpenseView(expenses: Expenses())
}
