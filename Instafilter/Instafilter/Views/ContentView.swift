//
//  ContentView.swift
//  Instafilter
//
//  Created by Javier Castañeda on 22/07/26.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedItem) {
                    ImagePreview(processedImage: processedImage)
                }
                .onChange(of: selectedItem, loadImage)
                SliderIntensity(filterIntensity: $filterIntensity)
                ButtonLeftAligned(
                    buttonText: "Change Filter",
                    buttonAction: changeFilter
                )
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }
    }
    
    private func changeFilter() {
        
    }
    
    private func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self),
                  let inputImage = UIImage(data: imageData) else { return }
        }
    }
}


#Preview {
    ContentView()
}
