//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Javier Castañeda on 09/09/26.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            ContentUnavailableView(
                "Welcome to SnowSeeker!",
                systemImage: "filemenu.and.selection",
                description: Text("Please select a resort from the left-hand menu; swipe from the left edge to show it.")
            )
        }
    }
}

#Preview {
    WelcomeView()
}
