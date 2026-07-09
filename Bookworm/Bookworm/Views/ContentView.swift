//
//  ContentView.swift
//  Bookworm
//
//  Created by Javier Castañeda on 08/07/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showAddNewBook: Bool = false
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]

    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    ListBookRow(book: book)
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing)  {
                    Button("Add Book", systemImage: "plus") {
                        showAddNewBook.toggle()
                    }
                }
            }
            .sheet(isPresented: $showAddNewBook) {
                AddNewBookView()
            }
        }
    }
}

#Preview {
    ContentView()
}
