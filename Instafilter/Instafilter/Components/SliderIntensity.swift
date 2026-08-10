//
//  SliderIntensity.swift
//  Instafilter
//
//  Created by Javier Castañeda on 10/08/26.
//

import SwiftUI

struct SliderIntensity: View {
    @Binding var filterIntensity: Double 
    var body: some View {
        HStack {
            Text("Intensity")
            Slider(value: $filterIntensity)
        }
        .padding(.vertical)
    }
}

//#Preview {
//    SliderIntensity(filterIntensity: <#Binding<Double>#>)
//}
