//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Javier Castañeda on 23/06/26.
//

import SwiftUI

struct ContentView: View {
   private let motto1 = Text("Draco dormiens")
   private let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    ContentView()
}
