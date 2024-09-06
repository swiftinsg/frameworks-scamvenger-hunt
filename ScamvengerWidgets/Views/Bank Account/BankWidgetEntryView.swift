//
//  BankWidgetEntryView.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI
import Charts

struct BankWidgetEntryView: View {
    var entry: BankWidgetEntry

    var body: some View {
        VStack {
            Text("$oon Bank - \(entry.configuration.option.rawValue) Account")
                .minimumScaleFactor(0.8)
                .lineLimit(1)
                .fontWeight(.bold)
            if !entry.configuration.option.data.isEmpty {
                Chart(entry.configuration.option.data.sorted(by: { $0.key < $1.key }), id: \.key) { point in
                    PointMark(
                        x: .value("Date", point.key),
                        y: .value("Balance (SGD)", point.value)
                    )
                    .foregroundStyle(entry.configuration.option.color)
                    
                    LineMark(
                        x: .value("Date", point.key),
                        y: .value("Balance (SGD)", point.value)
                    )
                    .foregroundStyle(entry.configuration.option.color.opacity(0.25))
                }
                .frame(minHeight: 80)
            } else {
                Spacer()
                Text("No data found.")
                    .font(.title)
                Spacer()
            }
        }
        .padding()
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .fontDesign(.monospaced)
    }
}
