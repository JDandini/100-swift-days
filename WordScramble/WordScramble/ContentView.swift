//
//  ContentView.swift
//  WordScramble
//
//  Created by Javier Castañeda on 25/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func testBundles() {
        guard let fileURL = Bundle.main.url(forResource: "words", withExtension: "txt"),
        let fileContents = try? String(contentsOf: fileURL, encoding: .utf8) else {
            print("nothing happens")
            return
        }
        print(fileContents)
    }
}

#Preview {
    ContentView()
}
