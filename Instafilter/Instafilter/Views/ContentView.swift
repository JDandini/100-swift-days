//
//  ContentView.swift
//  Instafilter
//
//  Created by Javier Castañeda on 22/07/26.
//

import StoreKit
import SwiftUI

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    var body: some View {
        VStack {
            Button("Leave a review") {
                requestReview()
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
