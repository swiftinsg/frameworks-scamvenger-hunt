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
        VStack {
            if game.state != .setUp {
                TimerView()
            }
            
            switch game.state {
            case .setUp:
                SetUpView()
            case .playingIdle:
                PlayingIdleView()
            case .playing(let station):
                GamePlayingView(station: station)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
        .tint(game.accentColor)
    }
}

#Preview {
    ContentView()
}
