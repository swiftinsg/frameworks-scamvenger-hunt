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
        
        var dates: [Date] = []
        for line in lines {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let date = dateFormatter.date(from: String(line))
            if let date = date {
                dates.append(date)
            }
        }
        
        var date = Date()
        if dates.count > 0 {
            date = dates[0]
        }
        
        
        var totals: [Double] = []
        for line in lines {
            if line.contains(".") {
                let money = Double(line.replacingOccurrences(of: "$ ", with: "").replacingOccurrences(of: "$", with: ""))
                if let money = money {
                    totals.append(money)
                }
            }
        }
        
        let total = totals.max() ?? 0
        
        self.tempExpenditures.append(Expenditure(date: Calendar.current.startOfDay(for: date), storeName: name, amount: total))
    }
    
    func reset() {
        tempExpenditures = []
    }
}
