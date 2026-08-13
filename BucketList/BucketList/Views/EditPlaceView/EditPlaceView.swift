//
//  EditPlaceView.swift
//  BucketList
//
//  Created by Javier Castañeda on 11/08/26.
//

import SwiftUI

struct EditPlaceView: View {
    @Environment(\.dismiss) var dismiss
    var onSave: (Location) -> Void
    @State private var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.newName)
                    TextField("Description", text: $viewModel.newDescription)
                }
                Section("Nearby…") {
                    switch viewModel.viewState {
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.placeAttributedDescription)
                        }
                    case .loading:
                        Text("Loading…")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    let newLocation = viewModel.locationToUpdate()
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.onSave = onSave
        viewModel =  ViewModel(location: location)
    }
}

#Preview {
    EditPlaceView(location: .example) { _ in }
}
