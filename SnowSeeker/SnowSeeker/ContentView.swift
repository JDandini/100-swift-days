//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Javier Castañeda on 04/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
            isShowingUser = true
        }
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id) { }
//        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    ContentView()
}


struct User: Identifiable {
    var id = "Taylor Swift"
}
