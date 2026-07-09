//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Javier Castañeda on 08/07/26.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
