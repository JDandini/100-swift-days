//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by F J Castaneda Ramos on 06/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }

    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentView()
}

@Observable
class User: Codable {
    var name = "Taylor"

    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
}
