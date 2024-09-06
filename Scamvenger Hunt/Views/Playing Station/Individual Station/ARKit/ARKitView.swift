//
//  ARKitView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct ARKitView: View {
    
    @Environment(Game.self) private var game

    @State private var countrySeanWentTo = ""
    @State private var isErrorPresented = false
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Sean's ")
                Text("Stolen")
                    .background(.tint.opacity(0.2))
                Text(" $oon")
                Spacer()
            }
            .font(.title3)
            .fontWeight(.medium)
            
            HStack {
                Text("Invisible Ink")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.tint)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Button("Done") {
                        if countrySeanWentTo.lowercased() == "canada" {
                            game.stationCompleted(.arKit)
                        } else {
                            isErrorPresented = true
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    Text(Date.now, style: .date)
                        .foregroundStyle(.secondary)
                }
            }
            
            ZStack(alignment: .topLeading) {
                ARViewContainer()
                
                List {
                    HStack(spacing: 0) {
                        Text("Country Sean fled to: ")
                            .fontWeight(.bold)
                        TextField("Country", text: $countrySeanWentTo)
                            .fixedSize()
                            .foregroundStyle(Color.accentColor)
                    }
                    .listRowBackground(Color.clear)
                }
                .frame(width: 500, height: 200)
                .padding()
                .background(.thickMaterial)
                .clipShape(.rect(cornerRadius: 8))
                .padding()
            }
            
            .listStyle(.plain)
        }
        .padding()
        .alert("Incorrect Information", isPresented: $isErrorPresented) {
            Button("Try Again") {}
        }
    }
}

#Preview {
    ARKitView()
}
