//
//  Scamvenger_HuntApp.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

@main
struct Scamvenger_HuntApp: App {
    
    @State private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
                .fontDesign(.monospaced)
        }
    }
}
