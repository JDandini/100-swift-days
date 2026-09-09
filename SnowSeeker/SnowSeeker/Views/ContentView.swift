//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Javier Castañeda on 04/09/26.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var body: some View {
        NavigationSplitView {
            List(resorts) { resort in
                NavigationLink(value: resort) {
                    ResortListRowView(resort: resort)
                }
            }
            .navigationTitle("Resorts")
        } detail: {
           WelcomeView()
        }
    }
}

#Preview {
    ContentView()
}
