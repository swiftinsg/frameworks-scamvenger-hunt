//
//  ReceiptScanner.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import Foundation
import Vision
import VisionKit

class ReceiptScanner: NSObject, ObservableObject, VNDocumentCameraViewControllerDelegate {
    
    @Published var tempStoreName: String = ""
    @Published var tempDate: Date = Date()
    @Published var tempTotal: Double = 0
    @Published var showConfirmationSheet: Bool = false
    
    func scanReceipt() {
        let scanViewController = VNDocumentCameraViewController()
        scanViewController.delegate = self
        UIApplication.shared.windows.first?.rootViewController?.present(scanViewController, animated: true, completion: nil)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        if scan.pageCount > 0 {
            let image = scan.imageOfPage(at: 0)
            recogniseText(in: image)
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    private func recogniseText(in image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNRecognizeTextRequest { [weak self] (request, error) in
            if let observations = request.results as? [VNRecognizedTextObservation] {
                self?.processObservations(observations)
            }
        }
        request.recognitionLevel = .accurate
        
        do {
            try requestHandler.perform([request])
        } catch {
            print("Unable to perform text recognition: \(error)")
        }
    }
    
    private func processObservations(_ observations: [VNRecognizedTextObservation]) {
        var recognizedText = ""
        
        for observation in observations {
            guard let topCandidate = observation.topCandidates(1).first else { continue }
            recognizedText += "\(topCandidate.string)\n"
        }
        
        parseReceiptData(from: recognizedText)
    }
    
    private func parseReceiptData(from text: String) {
        let lines = text.split(separator: "\n")
        
        self.tempStoreName = String(lines[0])
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let date = dateFormatter.date(from: String(lines[1])) ?? Date()
        self.tempDate = date
        
        for line in lines {
            if line.hasPrefix("Total: $") {
                self.tempTotal = Double(line.replacingOccurrences(of: "Total: $", with: "")) ?? 0
            }
        }
        showConfirmationSheet = true
    }
    
    func reset() {
        tempStoreName = ""
        tempDate = Date()
        tempTotal = 0
    }
}
