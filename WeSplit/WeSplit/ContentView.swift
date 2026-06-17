//
//  ContentView.swift
//  WeSplit
//
//  Created by Javier Castañeda on 17/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var nameEntered: String = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $nameEntered)
            Text("Your name is \(nameEntered)")
        }
    }
}

#Preview {
    ContentView()
}
