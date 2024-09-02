//
//  ExpenditureCardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import Charts

struct ExpenditureCardView: View {
    
    @State private var showingScanner = false
    @State private var showingConfirmationSheet = false
    
    @StateObject private var receiptScanner = ReceiptScanner()
    @EnvironmentObject private var expenditureData: ExpenditureData
    
    @Environment(Game.self) private var game
    
    var body: some View {
        CardView(title: "Sean’s Expenditure") {
            HStack {
                if !expenditureData.expenditures.isEmpty {
                    ExpenditureChartView()
                        .environmentObject(expenditureData)
                }
                VStack {
                    if !expenditureData.expenditures.isEmpty {
                        ExpenditureListView()
                            .environmentObject(expenditureData)
                    } else {
                        Text("Sean has left his receipts all over Singapore. Scan them and analyse his $oon spending to find out more information about the robbery.")
                            .multilineTextAlignment(.center)
                    }
                    Button("Scan Receipt") {
                        showingScanner.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .sheet(isPresented: $showingConfirmationSheet) {
            ConfirmNewExpenditureView(expenditures: $receiptScanner.tempExpenditures)
                .environment(game)
                .environmentObject(expenditureData)
                .environmentObject(receiptScanner)
        }
        .fullScreenCover(isPresented: $showingScanner) {
            ReceiptScannerView { result in
                switch result {
                case .success(let scannedImages):
                    for image in scannedImages {
                        receiptScanner.recogniseText(in: image)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
                showingScanner = false
            } didCancel: {
                showingScanner = false
            }
            .onDisappear {
                if !receiptScanner.tempExpenditures.isEmpty {
                    showingConfirmationSheet = true
                }
            }
        }
    }
}

#Preview {
    ExpenditureCardView()
}
