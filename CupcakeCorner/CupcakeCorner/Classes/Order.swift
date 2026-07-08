//
//  Order.swift
//  CupcakeCorner
//
//  Created by Javier Castañeda on 07/07/26.
//

import Foundation

@Observable
final class Order: Codable {
    var unitPrice: Decimal = 2

    enum Flavor: String, CaseIterable, Codable {
        case vanilla
        case strawberry
        case chocolate
        case rainbow

        var displayName: String {
            let value = self.rawValue
            return value.prefix(1).uppercased() + value.dropFirst()
        }

        var extraCharge: Decimal {
            switch self {
            case .rainbow: return 1
            default: return 0
            }
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
    var shippingAddress = Address.load() ?? Address()

    var total: Decimal {
        var cost = unitPrice * Decimal(quantity)
        cost += (flavor.extraCharge / 2)
        if extraFrosting {
            cost += Decimal(quantity)
        }

        if addSprinkles {
            cost += Decimal(quantity) / 2
        }

        return cost
    }
}

extension Order {
    enum CodingKeys: String, CodingKey {
        case _flavor = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _shippingAddress = "address"
    }
}
