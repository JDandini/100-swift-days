//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Javier Castañeda on 29/06/26.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
