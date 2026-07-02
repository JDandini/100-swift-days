//
//  ContentView.swift
//  Moonshot
//
//  Created by Javier Castañeda on 02/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, _ in
                size * 0.8
            }
            .clipped()
    }
}

#Preview {
    ContentView()
}
