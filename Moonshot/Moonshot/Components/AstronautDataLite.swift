//
//  AstronautDataLite.swift
//  Moonshot
//
//  Created by Javier Castañeda on 03/07/26.
//

import SwiftUI

struct AstronautDataLite: View {
    let member: Mission.CrewMember
    var body: some View {
        HStack {
            Image(member.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(.capsule)
                .overlay {
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                }
            VStack(alignment: .leading) {
                Text(member.astronaut.name)
                    .foregroundStyle(.white)
                    .font(.headline)
                Text(member.role)
                    .foregroundStyle(.white.opacity(0.5))
            }
        }
        .padding(.horizontal)
    }
}

