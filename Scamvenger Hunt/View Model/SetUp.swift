//
//  SetUp.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 29/08/2024.
//

import Foundation
import Observation
import Vision
import UIKit

@Observable
class SetUp {
    
    var faces: [VNFaceObservation] = []

    func detectFaces(image: UIImage?) {
        guard let image = image, let imageData = image.pngData() else {
            print("Failed to get PNG data from image.")
            return
        }
        
        let requestHandler = VNImageRequestHandler(data: imageData, options: [:])
        let detectFaceRequest = VNDetectFaceRectanglesRequest { (request, error) in
            if let error = error {
                print("Face detection error: \(error.localizedDescription)")
                return
            }
            
            if let results = request.results as? [VNFaceObservation] {
                DispatchQueue.main.async {
                    self.faces = results
                }
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                #if targetEnvironment(simulator)
                detectFaceRequest.usesCPUOnly = true
                #endif
                try requestHandler.perform([detectFaceRequest])
            } catch {
                print("Failed to perform request: \(error.localizedDescription)")
            }
        }
    }
    
    func extractFaces(image: UIImage, observations: [VNFaceObservation]) -> [UIImage] {
        var faceImages: [UIImage] = []
        
        for face in observations {
            let boundingBox = face.boundingBox
            
            let size = image.size
            let width = boundingBox.width * size.width
            let height = boundingBox.height * size.height
            let x = boundingBox.minX * size.width
            let y = (1 - boundingBox.minY) * size.height - height
            
            let faceRect = CGRect(x: x, y: y, width: width, height: height)
            
            if let faceImage = cropImageToRect(image: image, rect: faceRect) {
                let circularFaceImage = circularMaskImage(image: faceImage)
                faceImages.append(circularFaceImage)
            }
        }
        return faceImages
    }
    
    private func cropImageToRect(image: UIImage, rect: CGRect) -> UIImage? {
            guard let cgImage = image.cgImage?.cropping(to: rect) else { return nil }
            return UIImage(cgImage: cgImage, scale: image.scale, orientation: image.imageOrientation)
        }

        private func circularMaskImage(image: UIImage) -> UIImage {
            let renderer = UIGraphicsImageRenderer(size: image.size)
            return renderer.image { ctx in
                let rect = CGRect(origin: .zero, size: image.size)
                ctx.cgContext.addEllipse(in: rect)
                ctx.cgContext.clip()
                image.draw(in: rect)
            }
        }
}
