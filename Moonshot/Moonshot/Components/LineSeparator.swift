//
//  LineSeparator.swift
//  Moonshot
//
//  Created by Javier Castañeda on 03/07/26.
//

import SwiftUI

struct LineSeparator: View {
    var body: some View {
        Rectangle()
            .frame(height: 0.5)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    LineSeparator()
}
