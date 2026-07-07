//
//  Order.swift
//  CupcakeCorner
//
//  Created by Javier Castañeda on 07/07/26.
//

import Foundation

@Observable
class Order {
    enum Flavor: String, CaseIterable {
        case vanilla
        case strawberry
        case chocolate
        case rainbow

        var displayName: String {
            let value = self.rawValue
            return value.prefix(1).uppercased() + value.dropFirst()
        }
    }

    var flavor: Flavor = .vanilla
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
