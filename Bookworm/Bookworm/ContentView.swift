//
//  ContentView.swift
//  Bookworm
//
//  Created by Javier Castañeda on 08/07/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack {
            Form  {
                Section("Text section") {
                    TextEditor(text: $notes)
                        .navigationTitle("Notes")
                        .padding()
                }
            }

        }
    }
}

#Preview {
    ContentView()
}
