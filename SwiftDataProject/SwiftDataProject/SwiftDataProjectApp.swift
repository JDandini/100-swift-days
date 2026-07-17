//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Javier Castañeda on 09/07/26.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
        .modelContainer(for: Job.self)
    }
}
