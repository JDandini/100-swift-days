//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Javier Castañeda on 04/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var favorites = Favorites()
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
                    if favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                        .accessibilityLabel("This is a favorite resort")
                            .foregroundStyle(.red)
                    }
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
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
