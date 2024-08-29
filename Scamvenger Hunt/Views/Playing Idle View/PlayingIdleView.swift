//
//  PlayingIdleView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct PlayingIdleView: View {
    
    @Environment(Game.self) private var game
    
    var body: some View {
        VStack {
            TimerView()
            
            HintCardView(hint: game.currentStation?.hint ?? "No Current Station")
                .padding(.horizontal)
                .padding(.top, 8)
            
            HStack {
                BadgesCardView()
                RoundedRectangle(cornerRadius: 16)
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
        .tint(game.accentColor)
    }
}

#Preview {
    PlayingIdleView()
}
