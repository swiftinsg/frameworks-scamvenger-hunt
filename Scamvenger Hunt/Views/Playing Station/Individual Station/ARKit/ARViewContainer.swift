//
//  ARViewContainer.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 9/6/24.
//

import Foundation
import SwiftUI
import UIKit
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    let arView = ARView()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer

        init(parent: ARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            
            guard let imageAnchor = anchors[0] as? ARImageAnchor else {
                print("Problems loading anchor.")
                return
            }
            
            let width = Float(imageAnchor.referenceImage.physicalSize.width)
            let height = Float(imageAnchor.referenceImage.physicalSize.height)
            
            
            guard let texture = try? TextureResource.load(named: "MapAnnotated") else {
                print("ERROR LOADING TEXTURE")
                return
            }
            var material = UnlitMaterial()
            
            material.color = PhysicallyBasedMaterial
                .BaseColor(texture: .init(texture))
            
            // Sets the aspect ratio of the video to be played, and the corner radius of the video
            let plane = ModelEntity(mesh: .generatePlane(width: width, depth: height, cornerRadius: 0.3), materials: [material])
            
            let anchor = AnchorEntity(anchor: imageAnchor)
            
            anchor.addChild(plane)
            parent.arView.scene.addAnchor(anchor)
        }
    }
    
    func makeUIView(context: Context) -> ARView {
        guard let referenceImages = ARReferenceImage.referenceImages(
            inGroupNamed: "AR Resources", bundle: nil)
        else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        // Assigns coordinator to delegate the AR View
        arView.session.delegate = context.coordinator
        
        let configuration = ARImageTrackingConfiguration()
        configuration.isAutoFocusEnabled = true
        configuration.trackingImages = referenceImages
        configuration.maximumNumberOfTrackedImages = 1
        
        // Enables People Occulusion on supported iOS Devices
        if ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) {
            configuration.frameSemantics.insert(.personSegmentationWithDepth)
        } else {
            print("People Segmentation not enabled.")
        }
        
        arView.session.run(configuration)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
