//
//  PencilKitView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import PencilKit

struct PencilKitView: View {
    
    @State private var showingValidationScreen = false
    @State private var pkCanvasView = PKCanvasView()
    @State private var pkToolPicker = PKToolPicker()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading) {
                        HStack(spacing: 0) {
                            Text("Sean's ")
                            Text("Stolen")
                                .background(.tint.opacity(0.2))
                            Text(" $oon")
                        }
                        .font(.title3)
                        .fontWeight(.medium)
                        Text("Sketch a Facial Composite")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.tint)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Button("Done") {
                            pkToolPicker.setVisible(false, forFirstResponder: pkCanvasView)
                            pkToolPicker.addObserver(pkCanvasView)
                            showingValidationScreen.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        Text(Date.now, style: .date)
                            .foregroundStyle(.secondary)
                    }
                }
                Divider()
                    .padding(.top)
            }
            .padding([.horizontal, .top])
            GeometryReader { geometry in
                SketchCanvas(canvasView: $pkCanvasView, picker: $pkToolPicker)
                    .sheet(isPresented: $showingValidationScreen) {
                        PKValidationScreen(geometry: geometry, pkCanvasView: $pkCanvasView)
                            .onDisappear {
                                pkToolPicker.setVisible(true, forFirstResponder: pkCanvasView)
                                pkToolPicker.removeObserver(pkCanvasView)
                            }
                    }
            }
        }
    }
}

#Preview {
    PencilKitView()
}
