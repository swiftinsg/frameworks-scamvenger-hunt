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
    
    private(set) var temporaryPlayers: [Player] = []
    
    func detectFaces(image: UIImage?) {
        guard let image = image?.imageWithOrientationSetToUp(),
              let imageData = image.pngData() else {
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
                    self.reset()
                    self.extractFaces(image: image, observations: results)
                }
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try requestHandler.perform([detectFaceRequest])
            } catch {
                print("Failed to perform request: \(error.localizedDescription)")
            }
        }
    }
    
    private func extractFaces(image: UIImage, observations: [VNFaceObservation]) {
        for i in observations.indices {
            let boundingBox = observations[i].boundingBox
            
            let size = image.size
            let width = boundingBox.width * size.width
            let height = boundingBox.height * size.height
            let x = boundingBox.minX * size.width
            let y = (1 - boundingBox.minY) * size.height - height
            
            let faceRect = CGRect(x: x, y: y, width: width, height: height)
            
            if let faceImage = cropImageToRect(image: image, rect: faceRect) {
                let circularFaceImage = circularMaskImage(image: faceImage)
                temporaryPlayers.append(Player(profilePicture: circularFaceImage, color: Player.PlayerColor(rawValue: i % 8) ?? .blue))
            }
        }
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
    
    func removeTempPlayer(player: Player) {
        if let index = self.temporaryPlayers.firstIndex(where: { $0 == player }) {
            self.temporaryPlayers.remove(at: index)
            self.recalculateColors()
        }
    }
    
    private func recalculateColors() {
        var tempArr: [Player] = []
        for i in temporaryPlayers.indices {
            tempArr.append(
                Player(
                    id: temporaryPlayers[i].id,
                    profilePicture:temporaryPlayers[i].profilePicture,
                    color: Player.PlayerColor(rawValue: i % 8) ?? .blue
                )
            )
        }
        self.temporaryPlayers = tempArr
    }
    
    private func reset() {
        temporaryPlayers = []
    }
}

extension UIImage {
    func imageWithOrientationSetToUp() -> UIImage? {
        if self.imageOrientation == .up {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(origin: .zero, size: self.size))
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return normalizedImage
    }
}
