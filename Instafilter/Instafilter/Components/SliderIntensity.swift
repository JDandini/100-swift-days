//
//  SliderIntensity.swift
//  Instafilter
//
//  Created by Javier Castañeda on 10/08/26.
//

import SwiftUI

struct SliderIntensity: View {
    @Binding var filterIntensity: Double
    var action: () -> Void
    var body: some View {
        HStack {
            Text("Intensity")
            Slider(value: $filterIntensity)
                .onChange(of: filterIntensity, action)
        }
        .padding(.vertical)
    }
    
}

#Preview {
    @Previewable @State var intensity = 0.5
    SliderIntensity(filterIntensity: $intensity, action: {})
}
