//
//  SecondView.swift
//  iExpense
//
//  Created by F J Castaneda Ramos on 29/06/26.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

#Preview {
    SecondView(name: "Javier")
}
