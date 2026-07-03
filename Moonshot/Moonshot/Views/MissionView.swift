//
//  MissionView.swift
//  Moonshot
//
//  Created by Javier Castañeda on 03/07/26.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, _ in
                        width * 0.6
                    }
                    .padding(.vertical)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
                VStack(alignment: .leading) {
                    LineSeparator()

                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)

                    LineSeparator()

                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(mission.crewMembers, id: \.role) { member in
                            NavigationLink {
                                AstronautView(astronaut: member.astronaut)
                            } label: {
                                AstronautDataLite(member: member)
                            }
                        }
                    }
                }
                .padding(.top)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    MissionView(mission: missions[1])
        .preferredColorScheme(.dark)
}
