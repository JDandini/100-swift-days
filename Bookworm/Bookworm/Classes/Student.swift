//
//  Student.swift
//  Bookworm
//
//  Created by Javier Castañeda on 09/07/26.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
