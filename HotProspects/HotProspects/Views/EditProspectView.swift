//
//  EditProspectView.swift
//  HotProspects
//
//  Created by Javier Castañeda on 21/08/26.
//

import SwiftUI

struct EditProspectView: View {
    @Bindable var prospect: Prospect

    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
                .textContentType(.name)
                .font(.body)

            TextField("Email address", text: $prospect.emailAddress)
                .textContentType(.emailAddress)
                .font(.body)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)

            Toggle("Contacted", isOn: $prospect.isContacted)
        }
        .navigationTitle("Edit prospect")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        EditProspectView(
            prospect: Prospect(
                name: "Paul Hudson",
                emailAddress: "paul@hackingwithswift.com",
                isContacted: false)
        )
    }
}
