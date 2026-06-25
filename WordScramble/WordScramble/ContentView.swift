//
//  ContentView.swift
//  WordScramble
//
//  Created by Javier Castañeda on 25/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWork)
            .onAppear(perform: startGame)
        }
    }
    
    private func addNewWork() {
        let answer = newWord
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    private func startGame() {
        guard let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
        let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) else {
            fatalError("Could not load start.txt from bundle.")
        }
        
        let allWords = startWords.components(separatedBy: "\n")
        rootWord = allWords.randomElement() ?? "silkworm"
    }
}

#Preview {
    ContentView()
}
