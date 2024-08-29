//
//  HintCardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI
import CodeScanner

struct HintCardView: View {
    
    @Environment(Game.self) private var game
    
    @State private var isScannerPresented = false
    
    var body: some View {
        CardView(title: "Next Location Hint") {
            if let hint = game.currentStation?.hint {
                ZStack {
                    if let text = hint.text {
                        Text(text)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .lineLimit(7)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    }
                    
                    if let image = hint.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: hint.imageAlignment)
                            .padding(-16)
                    }
                    
                    Button("I’ve Arrived") {
                        isScannerPresented.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                }
            } else {
                Text("All stations are in use right now. Please try again later.")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .lineLimit(7)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
        .sheet(isPresented: $isScannerPresented) {
            CodeScannerView(codeTypes: [.qr], simulatedData: game.currentStation!.stationQRContent) { result in
                switch result {
                case .success(let data):
                    if data.string == game.currentStation!.stationQRContent {
                        isScannerPresented = false
                        withAnimation {
                            game.state = .playing(game.currentStation!)
                        }
                    }
                case .failure(_): break
                }
            }
        }
    }
}
