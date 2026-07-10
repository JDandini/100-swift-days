//
//  ReadDateView.swift
//  Bookworm
//
//  Created by Javier Castañeda on 09/07/26.
//

import SwiftUI

struct ReadDateView: View {
    let book: Book
    var body: some View {
        HStack {
            Image(systemName: "text.book.closed")
                .foregroundStyle(.indigo)
            Text("Read date:")
                .font(.headline)
                .foregroundStyle(.indigo)
            Text(book.formattedReadDate)
                .font(.callout.weight(.light))
                .foregroundStyle(.indigo)
        }
    }
}

#Preview {
    let book = Book(title: "Title",
                    author: "Author",
                    genre: "Drama",
                    review: "Good review",
                    rating: 1,
                    readDate: .now)
    ReadDateView(book: book)
}
