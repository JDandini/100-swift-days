//
//  MissionsList.swift
//  Moonshot
//
//  Created by Javier Castañeda on 03/07/26.
//

import SwiftUI

struct MissionsList: View {
    let missions: [Mission]
    var body: some View {
        List(missions) { mission in
            NavigationLink {
                MissionView(mission: mission)
            } label: {
                MissionListRow(mission: mission)
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    MissionsList(missions: missions)
}
