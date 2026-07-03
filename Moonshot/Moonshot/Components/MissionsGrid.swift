//
//  MissionsGrid.swift
//  Moonshot
//
//  Created by Javier Castañeda on 03/07/26.
//

import SwiftUI

struct MissionsGrid: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let missions: [Mission]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission)
                    } label: {
                        MissionGridTile(mission: mission)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    MissionsGrid(missions: missions)
}
