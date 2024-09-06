//
//  PlayingIdleView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct PlayingIdleView: View {
    
    @Environment(Game.self) private var game
    @EnvironmentObject private var expenditureData: ExpenditureData
    
    var body: some View {
        VStack {
            HintCardView()
                .padding(.horizontal)
                .padding(.top, 8)
            
            HStack {
                BadgesCardView()
                ExpenditureCardView()
                    .environment(game)
                    .environmentObject(expenditureData)
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
    }
}

#Preview {
    PlayingIdleView()
}
