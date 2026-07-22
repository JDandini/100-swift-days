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
    @State private var sortBy = [
        SortDescriptor(\ExpenseItem.amount, order: .reverse),
        SortDescriptor(\ExpenseItem.type)
    ]
    @State private var filterBy = "All"
    @Query var expenses: [ExpenseItem]
   
    private let currencyCode = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        NavigationStack {
            ExpenseListView(sortBy: sortBy, filterBy: filterBy)
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddExpenseView()
                    } label: {
                        Label("Add Expense", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        NavigationLink {
                            AddExpenseView()
                        } label: {
                            Label("Add Expense", systemImage: "plus")
                        }
                        Picker("Sort", selection: $sortBy) {
                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                    SortDescriptor(\ExpenseItem.type)
                                ])
                            
                            Text("Sort by type")
                                .tag([
                                    SortDescriptor(\ExpenseItem.type),
                                    SortDescriptor(\ExpenseItem.amount, order: .reverse)
                                ])
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Filter", systemImage: "line.3.horizontal.decrease") {
                        Picker("Filter", selection: $filterBy) {
                            Text("All expenses").tag("All")
                            Text("Personal expenses").tag("Personal")
                            Text("Business expenses").tag("Business")
                        }
                    }
                }
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(expenses[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self, inMemory: true) //line.3.horizontal.decrease
}
