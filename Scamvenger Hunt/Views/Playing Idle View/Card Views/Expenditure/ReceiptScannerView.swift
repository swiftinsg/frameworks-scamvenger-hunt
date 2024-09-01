//
//  ReceiptScannerView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 02/09/2024.
//

import Foundation
import SwiftUI
import Vision
import VisionKit

struct ReceiptScannerView: UIViewControllerRepresentable {
    
    let didFinishWith: ((_ result: Result<[UIImage], Error>) -> Void)
    let didCancel: () -> Void
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = context.coordinator
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {  }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(with: self)
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        let scannerView: ReceiptScannerView
        
        init(with scannerView: ReceiptScannerView) {
            self.scannerView = scannerView
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            var scannedPages = [UIImage]()
            for i in 0..<scan.pageCount {
                scannedPages.append(scan.imageOfPage(at: i))
            }
            
            scannerView.didFinishWith(.success(scannedPages))
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            scannerView.didCancel()
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            scannerView.didFinishWith(.failure(error))
        }
    }
}
