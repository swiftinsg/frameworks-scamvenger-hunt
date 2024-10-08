//
//  ConfirmNewExpenditureView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import SwiftUI

struct ConfirmNewExpenditureView: View {
    
    @Binding var expenditures: [Expenditure]
    
    @Environment(\.dismiss) private var dismiss
    @Environment(Game.self) private var game
    
    @EnvironmentObject private var receiptScanner: ReceiptScanner
    @EnvironmentObject private var expenditureData: ExpenditureData
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Add new ")
                Text("Expenditure")
                    .background(.tint.opacity(0.4))
            }
            .font(.title)
            .fontWeight(.bold)
            
            Text("Ensure that the Store Name, Date, and Total Amount is correct. Edit the information if necessary.")
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach($receiptScanner.tempExpenditures, id: \.id) { $expenditure in
                            EditExpenditureView(storeName: $expenditure.storeName, date: $expenditure.date, total: $expenditure.amount)
                                .frame(width: geometry.size.width - 150)
                        }
                        .scrollTransition { content, phase in
                            content.scaleEffect(phase.isIdentity ? 1 : 0.85)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                .safeAreaPadding(.horizontal, 75)
            }
            .padding(.horizontal, -30)
            
            Button {
                expenditureData.addExpenditure(expenditures: receiptScanner.tempExpenditures)
                dismiss()
                if expenditureData.expenditures.count >= 10 && !game.completedStations.contains(.swiftCharts) {
                    game.stationCompleted(.swiftCharts)
                }
            } label: {
                Text("Add ^[\(receiptScanner.tempExpenditures.count) Expenditure](inflect: true)")
                    .padding(10)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(receiptScanner.tempExpenditures.map { $0.storeName.isEmpty }.contains(true))
        }
        .padding(30)
        .onDisappear {
            receiptScanner.reset()
        }
    }
}
