//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Javier Castañeda on 01/07/26.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var id: UUID = UUID()
    var name: String
    var type: String
    var amount: Double
    
    init(
        name: String,
        type: String,
        amount: Double
    ) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}

