//
//  ReviewFacesView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct ReviewFacesView: View {
    
    @Environment(Game.self) private var game
    @Environment(SetUp.self) private var setUp
    
    @Binding var showingCamera: Bool
    
    var body: some View {
        VStack {
            Text("Everyone Here?")
                .font(.title)
                .fontWeight(.bold)
            Text("Tap \(Image(systemName: "minus.circle.fill").symbolRenderingMode(.multicolor)) to remove any misidentifications.")
                .font(.title3)
                .multilineTextAlignment(.center)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(setUp.temporaryPlayers, id: \.id) { player in
                        TemporaryPlayerCircleView(player: player)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            HStack {
                Button("Retake Photo") {
                    withAnimation {
                        showingCamera = true
                        setUp.reset()
                    }
                }
                .buttonStyle(.bordered)
                
                Button {
                    game.players = setUp.temporaryPlayers
                    game.state = .playingIdle
                } label: {
                    Text("Continue")
                }
                .buttonStyle(.borderedProminent)
                .disabled(setUp.temporaryPlayers.count > 4 || setUp.temporaryPlayers.isEmpty)
            }
        }
        .padding()
    }
}
