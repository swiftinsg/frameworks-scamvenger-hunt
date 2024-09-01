//
//  ReceiptScanner.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import SwiftUI
import Vision

class ReceiptScanner: NSObject, ObservableObject {
    
    @Published var tempExpenditures: [Expenditure] = []
    
    func recogniseText(in image: UIImage) {
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
        var name = ""
        if lines.count > 0 {
            name = String(lines[0])
        }
        
        var date = Date()
        if lines.count > 1 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM yyyy"
            date = dateFormatter.date(from: String(lines[1])) ?? Date()
        }
        
        var total = 0.0
        for line in lines {
            if line.hasPrefix("Total: $") {
                total = Double(line.replacingOccurrences(of: "Total: $", with: "")) ?? 0
            }
        }
        
        self.tempExpenditures.append(Expenditure(date: date, storeName: name, amount: total))
    }
    
    func reset() {
        tempExpenditures = []
    }
}
