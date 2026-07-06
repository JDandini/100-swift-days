//
//  Mission.swift
//  Moonshot
//
//  Created by Javier Castañeda on 02/07/26.
//

import Foundation

struct Mission: Codable, Identifiable, Hashable {
    struct CrewRole: Codable,Hashable {
        let name: String
        let role: String
    }

    struct CrewMember: Hashable {
        let role: String
        let astronaut: Astronaut
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String

    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }

    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }

    var crewMembers: [CrewMember] {
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        let crewMembers: [CrewMember] = crew.compactMap { role in
            if let astronaut = astronauts[role.name] {
                return CrewMember(role: role.role, astronaut: astronaut)
            } else {
                return nil
            }
        }
        return crewMembers
    }
}
