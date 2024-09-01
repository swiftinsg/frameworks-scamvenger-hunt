//
//  Scamvenger_HuntApp.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

@main
struct Scamvenger_HuntApp: App {
    
    @Namespace var namespace
    @State private var game = Game()
    
    init() {
        game.namespace = namespace
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
                .fontDesign(.monospaced)
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}
