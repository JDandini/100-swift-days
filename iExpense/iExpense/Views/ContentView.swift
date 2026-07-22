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
    @Query var expenses: [ExpenseItem]
   
    private let currencyCode = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        NavigationStack {
            ExpenseListView(sortBy: sortBy)
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddExpenseView()
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
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
        }
    }
    
    init() {
        _expenses = Query(sort: sortBy)
    }

    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(expenses[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self, inMemory: true)
}
