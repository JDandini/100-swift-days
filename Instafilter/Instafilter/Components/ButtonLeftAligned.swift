//
//  ButtonLeftAligned.swift
//  Instafilter
//
//  Created by Javier Castañeda on 10/08/26.
//

import SwiftUI
struct ButtonLeftAligned: View {
    var imageToShare: Image?
    let buttonText: String
    let buttonAction: @MainActor () -> Void
    var body: some View {
        HStack {
            Button(buttonText, action:  buttonAction)
                .disabled(imageToShare == nil)
            Spacer()
            
            // share the picture
            if let image = imageToShare {
                ShareLink(
                    item: image,
                    preview: SharePreview(
                        "Instafilter image",
                        image: image
                    )
                )
            }
        }
    }
}

#Preview  {
    ButtonLeftAligned(imageToShare: nil, buttonText: "Button to tap") {
        print("Pressed")
    }
}
