//
//  ExpenseListView.swift
//  iExpense
//
//  Created by Javier Castañeda on 22/07/26.
//

import SwiftData
import SwiftUI

struct ExpenseListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
 
    init(sortBy: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(sort: sortBy)
    }
 
    var body: some View {
        List {
            ForEach(expenses) { item in
                ExpenseRowView(item: item)
            }
            .onDelete(perform: removeItems)
        }
    }
 
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(expenses[index])
        }
    }
}
 
