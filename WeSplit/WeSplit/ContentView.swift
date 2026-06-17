//
//  ContentView.swift
//  WeSplit
//
//  Created by Javier Castañeda on 17/06/26.
//

import SwiftUI

struct ContentView: View {
    private let students =
    [
        "Harry",
        "Ron",
        "Hermione"
    ]
    @State private var selectedStudent: String = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self ) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
