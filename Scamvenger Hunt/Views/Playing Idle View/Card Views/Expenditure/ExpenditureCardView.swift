//
//  ExpenditureCardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import Charts

struct ExpenditureCardView: View {
    
    @State private var counter = 0
    @State private var expenditureData = ExpenditureData()
    
    var body: some View {
        CardView(title: "Sean’s Expenditure") {
            HStack {
                ExpenditureChartView(data: expenditureData.sortedExpenditures)
                    .environment(expenditureData)
                VStack {
                    ExpenditureListView(data: $expenditureData.expenditures)
                        .environment(expenditureData)
                    
                    Button("Scan Receipt") {
                        expenditureData.addExpenditure(expenditure: Expenditure(date: Date().addingTimeInterval(TimeInterval(86400 * counter)), storeName: "storey", amount: 120.69))
                        counter += 1
                    }
                    .buttonStyle(.borderedProminent)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    ExpenditureCardView()
}
