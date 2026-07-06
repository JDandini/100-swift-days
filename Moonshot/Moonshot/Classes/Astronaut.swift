//
//  Astronaut.swift
//  Moonshot
//
//  Created by Javier Castañeda on 02/07/26.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
