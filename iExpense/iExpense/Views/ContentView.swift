//
//  ContentView.swift
//  iExpense
//
//  Created by Javier Castañeda on 29/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    private let currencyCode = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.personalItems) { item in
                        ExpenseRowView(item: item)
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Business") {
                    ForEach(expenses.businessItems) { item in
                        ExpenseRowView(item: item)
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddExpenseView(expenses: expenses)
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
