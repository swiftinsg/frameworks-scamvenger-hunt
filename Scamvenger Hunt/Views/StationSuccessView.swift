//
//  StationSuccessView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct StationSuccessView: View {
    
    @Environment(Game.self) private var game
    
    var station: Station
    
    var body: some View {
        VStack {
            Text("You did it!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Image(systemName: station.icon)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding(32)
                .background(.tint)
                .clipShape(.circle)
                .matchedGeometryEffect(id: "badge.\(station.rawValue)", in: game.namespace!)
                .padding()
            
            Text(station.frameworks)
                .font(.title3)
            
            Button("Back to Home") {
                withAnimation {
                    game.state = .playingIdle
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
        .frame(maxHeight: .infinity)
    }
}
