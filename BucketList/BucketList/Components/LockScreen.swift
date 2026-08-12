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
    }
}

#Preview {
    @Previewable @State var viewModel = ContentView.ViewModel()
    LockScreen(viewModel: $viewModel)
}
