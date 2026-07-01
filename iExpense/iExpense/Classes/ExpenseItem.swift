//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Javier Castañeda on 01/07/26.
//

import Foundation
import Observation

struct ExpenseItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items: [ExpenseItem] = []
}
