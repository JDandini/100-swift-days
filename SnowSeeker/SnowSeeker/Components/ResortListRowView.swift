//
//  ResortListRowView.swift
//  SnowSeeker
//
//  Created by Javier Castañeda on 07/09/26.
//

import SwiftUI

struct ResortListRowView: View {
    let resort: Resort

    var body: some View {
        HStack {
            Image(resort.country)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 25)
                .clipShape(
                    .rect(cornerRadius: 5)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 1)
                )

            VStack(alignment: .leading) {
                Text(resort.name)
                    .font(.headline)
                Text("\(resort.runs) runs")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    let resort = Resort.example
    ResortListRowView(resort: resort)
}
