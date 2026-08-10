//
//  ContentView.swift
//  Instafilter
//
//  Created by Javier Castañeda on 22/07/26.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var pickerItems: [PhotosPickerItem] = []
    @State private var selectedImages: [Image] = []
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0 ..< selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                                .resizable()
                                .scaledToFit()
                }
            }
            PhotosPicker(
                selection: $pickerItems,
                maxSelectionCount: 3,
                matching: .any(of: [.images, .not(.screenshots)])
            ) {
                Label("Select a picture", systemImage: "photo")
            }

        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()

                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
    
}


#Preview {
    ContentView()
}
