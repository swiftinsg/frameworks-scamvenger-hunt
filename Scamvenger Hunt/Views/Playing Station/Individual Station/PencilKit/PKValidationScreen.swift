//
//  PKValidationScreen.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 31/08/2024.
//

import SwiftUI
import PencilKit

struct PKValidationScreen: View {
    
    @State private var text = ""
    @State private var isErrorPresented = false
    
    @State var image: UIImage
    
    @Environment(Game.self) private var game
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Done Sketching?")
                .font(.title)
                .fontWeight(.bold)
            Text("Go get your mentor to seek his/her approval.")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .padding()
                .border(.secondary, width: 4)
            HStack(spacing: 15) {
                TextField("Enter Validation Password", text: $text)
                Button("Submit") {
                    if text == "nevergonnagiveyouup" {
                        dismiss()
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        game.stationCompleted(.pencilKit)
                    } else {
                        isErrorPresented.toggle()
                    }
                }
                .disabled(text.isEmpty)
            }
            .padding(.vertical)
        }
        .padding()
        .alert("Incorrect Password", isPresented: $isErrorPresented) {
            Button("Try Again") {}
        }
    }
}
