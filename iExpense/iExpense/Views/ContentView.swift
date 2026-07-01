//
//  ContentView.swift
//  iExpense
//
//  Created by Javier Castañeda on 29/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    @State private var expenses = Expenses()
    private let currencyCode = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }

                            Spacer()
                            Text(
                                item.amount,
                                format: .currency(code: currencyCode)
                            )
                            .foregroundStyle(getAmountColor(for: item.amount))
                            .font(fontForAmount(item.amount))
                        }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddExpenseView(expenses: expenses)
        }
    }

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

    private func getAmountColor(for amount: Double) -> Color {
        if amount >= 0 && amount < 10 {
            return .teal
        } else if amount >= 10 && amount < 100 {
            return .yellow
        } else {
            return .red
        }
    }

    private func fontForAmount(_ amount: Double) -> Font {
        if amount >= 0 && amount < 15 {
            return .body
        } else {
            return .headline
        }
    }
}

#Preview {
    ContentView()
}
