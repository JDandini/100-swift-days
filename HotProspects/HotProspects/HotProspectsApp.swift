//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Javier Castañeda on 17/08/26.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
