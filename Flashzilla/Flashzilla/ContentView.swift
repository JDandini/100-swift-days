//
//  ContentView.swift
//  Flashzilla
//
//  Created by Javier Castañeda on 25/08/26.
//

import Combine
import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase

       var body: some View {
           Text("Hello, world!")
               .onChange(of: scenePhase) { oldPhase, newPhase in
                   if newPhase == .active {
                       print("Active")
                   } else if newPhase == .inactive {
                       print("Inactive")
                   } else if newPhase == .background {
                       print("Background")
                   }
               }
       }
}

#Preview {
    ContentView()
}
