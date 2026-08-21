//
//  ProspectListRow.swift
//  HotProspects
//
//  Created by Javier Castañeda on 20/08/26.
//

import SwiftUI

struct ProspectListRow: View {
    let prospect: Prospect
    private var isContactedImageName: String {
        prospect.isContacted ? "person.crop.circle.fill.badge.checkmark" : "person.crop.circle.badge.xmark"
    }
    
    var body: some View {
        HStack {
            Image(systemName: isContactedImageName)
            VStack(alignment: .leading) {
                Text(prospect.name)
                    .font(.headline)
                Text(prospect.emailAddress)
                    .foregroundStyle(.secondary)
            }
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
