//
//  ContentView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(Game.self) private var game
    
    var body: some View {
        switch game.state {
        case .setUp:
            SetUpView()
        case .playingIdle:
            EmptyView()
        case .playing(let station):
            EmptyView()
        }
    }
}

#Preview {
    ContentView()
}
