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
    
    @State var geometry: GeometryProxy
    @Binding var pkCanvasView: PKCanvasView
    
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
            Image(uiImage: pkCanvasView.drawing.image(from: CGRect(origin: CGPoint.zero, size: CGSize(width: geometry.size.width, height: geometry.size.height)), scale: 1.0))
                .resizable()
                .scaledToFit()
                .padding()
                .border(.secondary, width: 4)
            TextField("Enter Validation Password", text: $text)
            Button("Submit") {
                if text == "nevergonnagiveyouup" {
                    dismiss()
                    game.stationCompleted(.pencilKit)
                } else {
                    isErrorPresented.toggle()
                }
            }
            .disabled(text.isEmpty)
        }
        .padding()
        .alert("Incorrect Password", isPresented: $isErrorPresented) {
            Button("Try Again") {}
        }
    }
}
