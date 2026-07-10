//
//  ListRow.swift
//  Bookworm
//
//  Created by Javier Castañeda on 09/07/26.
//

import SwiftUI

struct ListBookRow: View {
    var book: Book
    var body: some View {
        NavigationLink(value: book) {
            HStack {
                EmojiRatingView(rating: book.rating)
                    .font(.largeTitle)

                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                        .foregroundStyle(book.rating > 1 ? .black : .red)
                    Text(book.author)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    let book = Book(title: "Title",
                    author: "Author",
                    genre: "Drama",
                    review: "Good review",
                    rating: 1,
                    readDate: nil)
    ListBookRow(book: book)
}
