//
//  CurrentPlayerBubbleView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct CurrentPlayerBubbleView: View {
    
    @Environment(Game.self) private var game
    
    var body: some View {
        Group {
            if let image = game.currentPlayer?.profilePicture {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: 120, height: 120)
        .background(.white)
        .clipShape(.circle)
        .overlay {
            Circle()
                .stroke(lineWidth: 4)
                .foregroundStyle(.tint)
        }
        .shadow(radius: 10)
    }
}

#Preview {
    CurrentPlayerBubbleView()
}
