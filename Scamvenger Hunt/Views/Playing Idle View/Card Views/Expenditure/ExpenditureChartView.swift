//
//  ExpenditureChartView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import SwiftUI
import Charts

struct ExpenditureChartView: View {
    
    @EnvironmentObject var expenditureData: ExpenditureData
    
    var body: some View {
        Chart(expenditureData.expenditures) { point in
            BarMark(
                x: .value("Date", point.date),
                y: .value("Expenditure (SGD)", point.amount)
            )
            .foregroundStyle(.tint)
        }
        .frame(maxWidth: .infinity)
        .chartScrollableAxes(.horizontal)
        .chartXAxis {
            AxisMarks(values: .automatic) { value in
                AxisValueLabel(format: .dateTime.month().day())
            }
        }
    }
}
