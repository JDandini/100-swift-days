//
//  Location.swift
//  BucketList
//
//  Created by Javier Castañeda on 11/08/26.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
