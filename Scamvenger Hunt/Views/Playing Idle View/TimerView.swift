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
    
    @State private var progress = 1.0
    
    @State private var timerTrackOpacity = 1.0
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(game.accentColor)
                .edgesIgnoringSafeArea(.top)
                .opacity(0.1)
            
            Rectangle()
                .fill(game.accentColor)
                .edgesIgnoringSafeArea(.top)
                .frame(width: width * progress)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(timerTrackOpacity)
            
            CurrentPlayerBubbleView()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            Text(game.groupName)
                .font(.title)
                .foregroundStyle(.black)
            
            Rectangle()
                .fill(.white)
                .edgesIgnoringSafeArea(.top)
                .frame(width: width * progress)
                .frame(maxWidth: .infinity, alignment: .leading)
                .mask {
                    Text(game.groupName)
                        .font(.title)
                        .foregroundStyle(.white)
                }
            
        }
        .frame(height: 64)
        .onChange(of: (game.currentPlayerStartDate ?? .distantPast), initial: true) { oldValue, newValue in
            if let endDate = game.currentPlayerEndDate {
                timerTrackOpacity = 0
                progress = 1
                withAnimation {
                    timerTrackOpacity = 1
                } completion: {
                    withAnimation(.linear(duration: abs(endDate.timeIntervalSinceNow))) {
                        progress = 0
                    }
                }
            }
        }
        .onGeometryChange(for: CGFloat.self) { proxy in
            proxy.size.width
        } action: { newValue in
            width = newValue
        }
    }
}

#Preview {
    TimerView()
}
