//
//  Address.swift
//  CupcakeCorner
//
//  Created by Javier Castañeda on 07/07/26.
//

import Foundation

@Observable
final class Address: Codable {
    private static let userDefaultsKey = "ShippingAddress"

    var name = "" {
        didSet{
            save()
        }
    }
    var streetAddress = ""
    {
        didSet{
            save()
        }
    }
    var city = ""
    {
        didSet{
            save()
        }
    }

    var zip = ""
    {
        didSet{
            save()
        }
    }

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

// MARK: - Persistence
extension Address {
    func save() {
        guard let encoded = try? JSONEncoder().encode(self) else {
            return
        }
        UserDefaults.standard.set(encoded, forKey: Self.userDefaultsKey)
    }

    static func load() -> Address? {
        guard let data = UserDefaults.standard.data(forKey: Self.userDefaultsKey),
              let address = try? JSONDecoder().decode(Self.self, from: data) else {
            return nil
        }
        return address
    }
}


extension String {
    var isEmptyOrWhitespace: Bool {
        isEmpty || trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
