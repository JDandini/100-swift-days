//
//  ContentView.swift
//  Moonshot
//
//  Created by Javier Castañeda on 02/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showAsGrid: Bool = true
    private let missions: [Mission] = Bundle.main.decode("missions.json")

    @ViewBuilder
    private var missionsView: some View {
        if showAsGrid {
            MissionsGrid(missions: missions)
        } else {
            MissionsList(missions: missions)
        }
    }

    var body: some View {
        NavigationStack {
            missionsView
                .toolbar {
                    Button {
                        showAsGrid.toggle()
                    } label: {
                        Image(systemName: getIconName())
                    }
                }
                .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
        }
    }

    private func getIconName() -> String {
        guard showAsGrid else {
            return "square.grid.2x2"
        }
        return "list.bullet"
    }


}

#Preview {
    ContentView()
}
