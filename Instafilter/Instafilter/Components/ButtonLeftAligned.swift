//
//  ButtonLeftAligned.swift
//  Instafilter
//
//  Created by Javier Castañeda on 10/08/26.
//

import SwiftUI
struct ButtonLeftAligned: View {
    let buttonText: String
    let buttonAction: @MainActor () -> Void
    var body: some View {
        HStack {
            Button(buttonText, action:  buttonAction)
            Spacer()
            
            // share the picture
        }
    }
}

#Preview  {
    ButtonLeftAligned(buttonText: "Button to tap") {
        print("Pressed")
    }
}
