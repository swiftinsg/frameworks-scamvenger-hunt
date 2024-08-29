//
//  TimerView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct TimerView: View {
    
    @Environment(Game.self) private var game
    
    @State private var width: CGFloat = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(game.currentPlayer?.color.color ?? .red)
                .edgesIgnoringSafeArea(.top)
            
            HStack {
                CurrentPlayerBubbleView()
                
                Text(game.groupName)
                    .font(.title)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
        }
        .onGeometryChange(for: CGFloat.self) { proxy in
            proxy.size.width
        } action: { newValue in
            width = newValue
        }
        .frame(height: 48)
    }
}

#Preview {
    TimerView()
}
