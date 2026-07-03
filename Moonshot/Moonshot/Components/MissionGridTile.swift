//
//  MissionGridTile.swift
//  Moonshot
//
//  Created by Javier Castañeda on 02/07/26.
//

import SwiftUI

struct MissionGridTile: View {
    let mission: Mission
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }

        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )


    }
}

#Preview {
    MissionGridTile(
        mission: Mission(
            id: 1,
            launchDate: nil,
            crew: [],
            description: ""
        )
    )
}
