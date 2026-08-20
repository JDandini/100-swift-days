//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Javier Castañeda on 20/08/26.
//

import SwiftData
import SwiftUI

struct ProspectsView: View {
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var modelContext
    let filter: FilterType

    var body: some View {
        NavigationStack {
            List(prospects) { prospect in
                ProspectListRow(prospect: prospect)
            }
            .navigationTitle(title)
            .toolbar {
                Button("Scan", systemImage: "qrcode.viewfinder") {
                    let prospect = Prospect(name: "Paul Hudson", emailAddress: "paul@hackingwithswift.com", isContacted: false)
                    modelContext.insert(prospect)
                }
            }
        }
    }

    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }

    init(filter: FilterType) {
        self.filter = filter

        if filter != .none {
            let showContactedOnly = filter == .contacted

            _prospects = Query(
                filter: #Predicate {
                    $0.isContacted == showContactedOnly
                },
                sort: [SortDescriptor(\Prospect.name)]
            )
        }
    }
}

extension ProspectsView {
    enum FilterType {
        case none, contacted, uncontacted
    }
}
#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
