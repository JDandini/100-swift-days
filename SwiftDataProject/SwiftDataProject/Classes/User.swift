//
//  User.swift
//  SwiftDataProject
//
//  Created by Javier Castañeda on 16/07/26.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date

    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}

