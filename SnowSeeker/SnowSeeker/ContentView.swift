//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Javier Castañeda on 04/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
            NavigationLink("Primary") {
                Text("New view")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
}
