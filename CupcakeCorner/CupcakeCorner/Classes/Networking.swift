//
//  Networking.swift
//  CupcakeCorner
//
//  Created by Javier Castañeda on 08/07/26.
//

import Foundation

final class Networking {
    func place(order: Order) async -> Result<Order, Error>  {
        guard let encoded = try? JSONEncoder().encode(order) else {
            return .failure(NetworkingError.encodingError)
        }
        guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
            return .failure(NetworkingError.invalidURL)
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            // handle the result
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            return .success(decodedOrder)
        } catch {
            return .failure(error)
        }
    }
}

enum NetworkingError: Error {
    case encodingError
    case invalidURL
}
