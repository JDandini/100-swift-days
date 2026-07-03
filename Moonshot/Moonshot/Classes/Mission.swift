//
//  Mission.swift
//  Moonshot
//
//  Created by Javier Castañeda on 02/07/26.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
