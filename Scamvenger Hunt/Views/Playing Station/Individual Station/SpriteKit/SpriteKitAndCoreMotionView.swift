//
//  SpriteKitAndCoreMotionView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import SpriteKit

struct SpriteKitAndCoreMotionView: View {
    
    @Environment(Game.self) private var game
    
    @State private var currentMapIndex: Int?
    @State private var geometrySize: CGSize = .zero
    @State private var didFail = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Text("Sean's ")
                    Text("Stolen")
                        .background(.tint.opacity(0.2))
                    Text(" $oon")
                }
                .font(.title3)
                .fontWeight(.medium)
                
                HStack {
                    Text(currentMapIndex == nil ? "Find the Correct Map" : "Navigate to Sean's Secret $oon Stash")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.tint)
                    
                    Spacer()
                    
                    Text(Date.now, style: .date)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
            
            ZStack {
                if let currentMapIndex {
                    if !didFail {
                        SpriteKitMapView(index: currentMapIndex, geometrySize: geometrySize) {
                            if currentMapIndex == 1 {
                                game.stationCompleted(.spriteKitAndCoreMotion)
                            } else {
                                withAnimation {
                                    didFail = true
                                }
                            }
                        }
                        
                        Button {
                            withAnimation {
                                self.currentMapIndex = nil
                            }
                        } label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .imageScale(.large)
                                .font(.largeTitle)
                        }
                        .padding(.leading)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    } else {
                        VStack {
                            Text("Wrong Map")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("Look carefully at the clues in the room to select the correct map.")
                            
                            Button("Try Again") {
                                withAnimation {
                                    didFail = false
                                    self.currentMapIndex = nil
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                } else {
                    KeypadEntryView(currentMapIndex: $currentMapIndex)
                        .padding(.horizontal)
                }
            }
            .onGeometryChange(for: CGSize.self) { proxy in
                proxy.size
            } action: { newValue in
                geometrySize = newValue
            }
        }
        .padding([.trailing, .vertical])
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    SpriteKitAndCoreMotionView()
}
