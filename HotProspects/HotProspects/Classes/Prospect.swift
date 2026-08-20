//
//  Prospect.swift
//  HotProspects
//
//  Created by Javier Castañeda on 20/08/26.
//

import SwiftData

@Model
final class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool

    init(
        name: String,
        emailAddress: String,
        isContacted: Bool
    ) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
}
