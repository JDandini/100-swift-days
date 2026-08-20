//
//  ProspectListRow.swift
//  HotProspects
//
//  Created by Javier Castañeda on 20/08/26.
//

import SwiftUI

struct ProspectListRow: View {
    let prospect: Prospect
    var body: some View {
        VStack(alignment: .leading) {
            Text(prospect.name)
                .font(.headline)
            Text(prospect.emailAddress)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    let prospect = Prospect(
        name: "John Doe",
        emailAddress: "john@doe.com",
        isContacted: true
    )
    ProspectListRow(prospect: prospect)
}
