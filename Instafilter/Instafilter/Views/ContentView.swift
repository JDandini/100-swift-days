//
//  ContentView.swift
//  Instafilter
//
//  Created by Javier Castañeda on 22/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationStack {
            VStack {
                ImagePreview(processedImage: processedImage)
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
}


#Preview {
    ContentView()
}
