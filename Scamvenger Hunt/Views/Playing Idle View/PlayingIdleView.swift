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
            TimerView(groupName: "hello")
            
            HintCardView(hint: "The police have requested your help to assist in the case. Go over to the neighbourhood police centre by taking seven stops towards Dhoby Ghaut, and then one stop towards Marina South Pier, where the robbery was first reported.")
                .padding(.horizontal)
                .padding(.top, 8)
            
            HStack {
                RoundedRectangle(cornerRadius: 16)
                RoundedRectangle(cornerRadius: 16)
            }
            .padding(.horizontal)
            
            CurrentPlayerBubbleView()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        .padding(.bottom)
        .tint(game.accentColor)
    }
}

#Preview {
    PlayingIdleView()
}
