//
//  ContentView.swift
//  Moonshot
//
//  Created by Javier Castañeda on 02/07/26.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(String(astronauts.count))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
