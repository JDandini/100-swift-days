//
//  ContentView.swift
//  BucketList
//
//  Created by Javier Castañeda on 10/08/26.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()

    var body: some View {
        if viewModel.isUnlocked {
            MapView(viewModel: $viewModel)
        } else {
            LockScreen(viewModel: $viewModel)
        }
    }
}

#Preview {
    ContentView()
}
