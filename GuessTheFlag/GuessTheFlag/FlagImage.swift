//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Javier Castañeda on 23/06/26.
//

import SwiftUI

struct FlagImage: View {
    let flagName: String
    
    var body: some View {
        Image(flagName)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    FlagImage(flagName: "Spain")
}
