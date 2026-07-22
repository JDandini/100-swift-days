//
//  ContentView.swift
//  iExpense
//
//  Created by Javier Castañeda on 29/06/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]

    private let currencyCode = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.filter { $0.type == "Personal" }) { item in
                        ExpenseRowView(item: item)
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, type: "Personal")
                    }
                }
                Section("Business") {
                    ForEach(expenses.filter { $0.type == "Business" }) { item in
                        ExpenseRowView(item: item)
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, type: "Business")
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddExpenseView()
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
            }
        }
    }

    func removeItems(at offsets: IndexSet, type: String) {
        let filtered = expenses.filter { $0.type == type }
        for index in offsets {
            modelContext.delete(filtered[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self, inMemory: true)
}
