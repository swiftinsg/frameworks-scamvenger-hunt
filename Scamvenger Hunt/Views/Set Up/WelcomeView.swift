//
//  WelcomeView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var showingCamera: Bool
    
    @Environment(Game.self) private var game
    
    @State private var showingDebugMenu = false
    
    var body: some View {
        VStack {
            TextField("Group Name", text: Binding(get: {
                game.groupName
            }, set: { newValue in
                game.groupName = newValue
            }))
            .multilineTextAlignment(.center)

            Spacer()
            
            HStack {
                Text("The ")
                Text("$oon")
                    .background(.yellow)
                Text(" Heist")
            }
            .font(.title)
            .fontWeight(.bold)
            .onTapGesture {
                showingDebugMenu = true
            }
            
            Text("Get started by filling in your group name at the top and taking a group photo.")
                .font(.title3)
                .multilineTextAlignment(.center)
            
            Button {
                showingCamera.toggle()
            } label: {
                Text("Take Group Photo")
            }
            .buttonStyle(.borderedProminent)
            .disabled(game.groupName.isEmpty)
            
            Spacer()
        }
        .sheet(isPresented: $showingDebugMenu) {
            DebugView()
                .environment(game)
        }
    }
}
