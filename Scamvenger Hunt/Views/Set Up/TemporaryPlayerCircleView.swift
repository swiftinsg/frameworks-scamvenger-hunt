//
//  TemporaryPlayerCircleView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct TemporaryPlayerCircleView: View {
    
    var player: Player
    
    @Environment(SetUp.self) private var setUp
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(player.color.color)
                .frame(width: 210)
            Group {
                if let profilePicture = player.profilePicture {
                    Image(uiImage: profilePicture)
                        .resizable()
                } else {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                }
            }
            .scaledToFit()
            .frame(width: 200, height: 200)
            .overlay(alignment: .topTrailing) {
                Button {
                    withAnimation {
                        setUp.removeTempPlayer(player: player)
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .symbolRenderingMode(.multicolor)
                }
                .buttonStyle(.plain)
            }
        }
    }
}
