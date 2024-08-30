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
            
            Text("Get started by taking a group photo.")
                .font(.title3)
                .multilineTextAlignment(.center)
            
            Button {
                showingCamera.toggle()
            } label: {
                Text("Take Photo")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}
