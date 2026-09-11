//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Javier Castañeda on 04/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
           resorts
        } else {
            resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    ResortListRowView(resort: resort)
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
        } detail: {
           WelcomeView()
        }
    }
}

#Preview {
    ContentView()
}
