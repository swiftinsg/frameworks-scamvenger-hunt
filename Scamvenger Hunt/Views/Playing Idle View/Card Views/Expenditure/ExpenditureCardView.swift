//
//  ExpenditureCardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import Charts

struct ExpenditureCardView: View {
    
    @StateObject private var receiptScanner = ReceiptScanner()
    @State private var expenditureData = ExpenditureData()
    
    @Environment(Game.self) private var game
    
    var body: some View {
        CardView(title: "Sean’s Expenditure") {
            HStack {
                if !expenditureData.expenditures.isEmpty {
                    ExpenditureChartView(data: $expenditureData.expenditures)
                        .environment(expenditureData)
                }
                VStack {
                    if !expenditureData.expenditures.isEmpty {
                        ExpenditureListView(data: $expenditureData.expenditures)
                            .environment(expenditureData)
                    }
                    
                    Button("Scan Receipt") {
                        receiptScanner.scanReceipt()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .sheet(isPresented: $receiptScanner.showConfirmationSheet) {
            ConfirmNewExpenditureView(
                storeName: $receiptScanner.tempStoreName,
                date: $receiptScanner.tempDate,
                total: $receiptScanner.tempTotal
            )
            .environment(expenditureData)
            .environment(game)
        }
    }
}

#Preview {
    ExpenditureCardView()
}
