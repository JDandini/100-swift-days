//
//  Card.swift
//  Flashzilla
//
//  Created by Javier Castañeda on 26/08/26.
//

import Foundation

struct Card {
    var prompt: String
    var answer: String

    static let example = Card(
        prompt: "Who played the 13th Doctor in Doctor Who?",
        answer: "Jodie Whittaker"
    )
}
