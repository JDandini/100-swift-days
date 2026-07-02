//
//  ExpenseRowView.swift
//  iExpense
//
//  Created by Javier Castañeda on 01/07/26.
//

import SwiftUI

struct ExpenseRowView: View {
    var item: ExpenseItem
    private let currencyCode = Locale.current.currency?.identifier ?? "USD"
    var body: some View {
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
    ExpenseRowView(item: ExpenseItem(name: "Some expense",
                                     type: "Personal",
                                     amount: 10)
    )
}
