//
//  SketchCanvas.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 30/08/2024.
//

import SwiftUI
import PencilKit

struct SketchCanvas: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    let picker = PKToolPicker.init()
    
    func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        self.canvasView.becomeFirstResponder()
        self.canvasView.drawingPolicy = .pencilOnly
        self.picker.showsDrawingPolicyControls = false
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        picker.addObserver(canvasView)
        picker.setVisible(true, forFirstResponder: uiView)
        DispatchQueue.main.async {
            uiView.becomeFirstResponder()
        }
    }
}
