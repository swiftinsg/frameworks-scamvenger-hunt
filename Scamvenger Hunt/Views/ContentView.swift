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
                    .ignoresSafeArea(.keyboard, edges: .bottom)
            case .playingIdle:
                PlayingIdleView()
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                    .environmentObject(expenditureData)
            case .playing(let station):
                StationView(station: station)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            case .success(let station):
                StationSuccessView(station: station)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
            }
        }
        .tint(game.accentColor)
    }
}

#Preview {
    ContentView()
}
