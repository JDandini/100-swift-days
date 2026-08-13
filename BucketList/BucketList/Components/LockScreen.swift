//
//  LockScreen.swift
//  BucketList
//
//  Created by Javier Castañeda on 12/08/26.
//

import SwiftUI

struct LockScreen: View {
    @Binding var viewModel: ContentView.ViewModel
    var body: some View {
        VStack {
            ContentUnavailableView(
                "Unlock Places",
                systemImage: "lock.shield",
                description: Text("Tap to unlock places")
            )
            .onTapGesture {
                viewModel.authenticate()
            }
        }
        .alert("Authentication error", isPresented: Binding(
            get: { viewModel.authenticationError != nil },
            set: { if !$0 { viewModel.authenticationError = nil } }
        )) {
            Button("OK") {}
        } message: {
            Text(viewModel.authenticationError?.localizedDescription ?? "Unknown error")
        }
    }
}

#Preview {
    @Previewable @State var viewModel = ContentView.ViewModel()
    LockScreen(viewModel: $viewModel)
}
