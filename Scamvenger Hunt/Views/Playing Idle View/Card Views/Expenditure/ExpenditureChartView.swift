//
//  ExpenditureChartView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import SwiftUI
import Charts

struct ExpenditureChartView: View {
    
    @Binding var data: [Expenditure]
    
    var body: some View {
        Chart(data) { point in
            PointMark(
                x: .value("Date", point.date),
                y: .value("Expenditure (SGD)", point.amount)
            )
            .foregroundStyle(.tint)
            
            LineMark(
                x: .value("Date", point.date),
                y: .value("Expenditure (SGD)", point.amount)
            )
            .foregroundStyle(.tint.opacity(0.25))
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
