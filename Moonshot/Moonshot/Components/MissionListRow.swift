//
//  MissionListRow.swift
//  Moonshot
//
//  Created by Javier Castañeda on 03/07/26.
//

import SwiftUI

struct MissionListRow: View {
    let mission: Mission
    var body: some View {
        HStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { width, _ in
                    width * 0.25
                }
                .padding()
            VStack(alignment: .leading) {
                Text(mission.displayName)
                    .font(.headline)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.horizontal)
        }
        .background(Color.darkBackground)

    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    MissionListRow(mission: missions[2])
        .preferredColorScheme(.dark)
}
