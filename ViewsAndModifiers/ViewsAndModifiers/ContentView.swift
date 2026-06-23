//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Javier Castañeda on 23/06/26.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            Text("Blue large title")
                .blueTitle()
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, column in
            Image(systemName: "\(row * 4 + column).circle")
            Text("R\(row) C\(column)")
        }
    }
}

struct LargeBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func blueTitle() -> some View {
        self.modifier(LargeBlueTitle())
    }
}


#Preview {
    ContentView()
}
