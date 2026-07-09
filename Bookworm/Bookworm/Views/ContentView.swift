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
    @Query(sort: [
        SortDescriptor(\Book.rating, order: .reverse),
        SortDescriptor(\Book.title)
    ]) var books: [Book]

    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    ListBookRow(book: book)
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing)  {
                    Button("Add Book", systemImage: "plus") {
                        showAddNewBook.toggle()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddNewBook) {
                AddNewBookView()
            }
            .navigationDestination(for: Book.self) { book in
                BookDetailView(book: book)
            }
        }
    }

    func deleteBooks(at offsets: IndexSet) {
        offsets.forEach { offset in
            let book = books[offset]

            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
