//
//  Address.swift
//  CupcakeCorner
//
//  Created by Javier Castañeda on 07/07/26.
//

import Foundation

@Observable
final class Address: Codable {
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""

    var isValidAddress: Bool {
        !name.isEmptyOrWhitespace && !streetAddress.isEmptyOrWhitespace && !city.isEmptyOrWhitespace && !zip.isEmptyOrWhitespace
    }

    enum CodingKeys: String, CodingKey {
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
}


extension String {
    var isEmptyOrWhitespace: Bool {
        isEmpty || trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
