//
//  ImagePreview.swift
//  Instafilter
//
//  Created by Javier Castañeda on 10/08/26.
//

import SwiftUI

struct ImagePreview: View {
    var processedImage: Image?
    var body: some View {
        Spacer()
        if let processedImage {
            processedImage
                .resizable()
                .scaledToFit()
        } else {
            ContentUnavailableView(
                "No Picture",
                systemImage: "photo.badge.plus",
                description: Text("Tap to import a photo")
            )
        }
        Spacer()
    }
}

#Preview("No Image") {
    ImagePreview(processedImage: nil)
}
