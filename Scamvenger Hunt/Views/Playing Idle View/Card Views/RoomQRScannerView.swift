//
//  RoomQRScannerView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import CodeScanner

struct RoomQRScannerView: View {
    
    @Environment(Game.self) private var game
    
    @Environment(\.dismiss) var dismiss
    @State private var showErrorAlert = false
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Scan the ")
                Text("Room QR code")
                    .background(.tint.opacity(0.4))
            }
            .font(.title)
            .fontWeight(.bold)
            
            Text("Scan the room’s QR code to start the station.")
            
            CodeScannerView(codeTypes: [.qr], scanMode: .oncePerCode, simulatedData: game.currentStation!.stationQRContent) { result in
                switch result {
                case .success(let data):
                    if data.string == game.currentStation!.stationQRContent {
                        dismiss()
                        withAnimation {
                            game.state = .playing(game.currentStation!)
                        }
                    } else {
                        showErrorAlert = true
                    }
                case .failure(_):
                    showErrorAlert = true
                }
            }
            .frame(width: 500, height: 500)
        }
        .padding()
        .alert("Incorrect Code", isPresented: $showErrorAlert) {
            Button("Try Again") {
            }
        }
    }
}

#Preview {
    RoomQRScannerView()
}
