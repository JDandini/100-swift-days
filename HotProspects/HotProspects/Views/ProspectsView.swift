//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Javier Castañeda on 20/08/26.
//

import SwiftUI

struct ProspectsView: View {
    let filter: FilterType
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle(title)
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
}

extension ProspectsView {
    enum FilterType {
        case none, contacted, uncontacted
    }
}
#Preview {
    ProspectsView(filter: .none)
}
