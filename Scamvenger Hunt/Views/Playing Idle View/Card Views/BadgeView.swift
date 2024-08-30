//
//  BadgeView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct BadgeView: View {
    
    @Environment(Game.self) private var game
    
    var station: Station
    var isAttained: Bool {
        game.completedStations.contains(station)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.tint)
                .opacity(isAttained ? 1 : 0.2)
            
            Image(systemName: isAttained ? station.icon : "lock")
                .foregroundStyle(isAttained ? .white : .black)
                .font(.title)
        }
        .matchedGeometryEffect(id: "badge.\(station.rawValue)", in: game.namespace!)
    }
}
