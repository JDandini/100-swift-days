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
        !name.isEmpty && !streetAddress.isEmpty && !city.isEmpty && !zip.isEmpty
    }

    enum CodingKeys: String, CodingKey {
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
}
