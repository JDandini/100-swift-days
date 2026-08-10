//
//  SliderIntensity.swift
//  Instafilter
//
//  Created by Javier Castañeda on 10/08/26.
//

import SwiftUI

struct SliderAndText: View {
    @Binding var sliderValue: Double
    var title: String
    var action: () -> Void
    var body: some View {
        HStack {
            Text(title)
            Slider(value: $sliderValue)
                .onChange(of: sliderValue, action)
        }
        .padding(.vertical)
    }
    
}

#Preview {
    @Previewable @State var intensity = 0.5
    SliderAndText(
        sliderValue: $intensity,
        title: "Slider",
        action: {}
    )
}
