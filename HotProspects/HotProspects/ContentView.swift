//
//  ContentView.swift
//  HotProspects
//
//  Created by Javier Castañeda on 17/08/26.
//

import SwiftUI

struct ContentView: View {

    @State private var selection: Set<String> = []
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
    var body: some View {
        NavigationStack {
            List(
                users,
                id: \.self,
                selection: $selection
            ) { user in
                Text(user)
            }
            .navigationTitle("Users")
            .toolbar {
                EditButton()
            }
            if !selection.isEmpty {
                Text("You selected \(selection.formatted())")
            }
        }
    }
}

#Preview {
    ContentView()
}
