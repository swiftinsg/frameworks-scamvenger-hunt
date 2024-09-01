//
//  ContentView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(Game.self) private var game
    @StateObject private var expenditureData = ExpenditureData()
    
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
                    .environmentObject(expenditureData)
            case .playing(let station):
                StationView(station: station)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            case .success(let station):
                StationSuccessView(station: station)
            }
        }
        .tint(game.accentColor)
    }
}

#Preview {
    ContentView()
}
