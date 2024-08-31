//
//  ExpenditureCardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import Charts

struct Expenditure: Identifiable {
    let id = UUID()
    var date: Date
    var storeName: String
    var amount: Double
}

struct ExpenditureCardView: View {
    
    @State var data: [Expenditure] = [
        Expenditure(date: Date().addingTimeInterval(-86400 * 13), storeName: "storename", amount: 12),
        Expenditure(date: Date().addingTimeInterval(-86400 * 12), storeName: "storename", amount: 183),
        Expenditure(date: Date().addingTimeInterval(-86400 * 11), storeName: "storename", amount: 329),
        Expenditure(date: Date().addingTimeInterval(-86400 * 10), storeName: "storename", amount: 65.4),
        Expenditure(date: Date().addingTimeInterval(-86400 * 9), storeName: "storename", amount: 123),
        Expenditure(date: Date().addingTimeInterval(-86400 * 8), storeName: "storename", amount: 241),
        Expenditure(date: Date().addingTimeInterval(-86400 * 7), storeName: "storename", amount: 200),
        Expenditure(date: Date().addingTimeInterval(-86400 * 6), storeName: "storename", amount: 150.0),
        Expenditure(date: Date().addingTimeInterval(-86400 * 5), storeName: "storename", amount: 200.0),
        Expenditure(date: Date().addingTimeInterval(-86400 * 4), storeName: "storename", amount: 180.0),
        Expenditure(date: Date().addingTimeInterval(-86400 * 3), storeName: "storename", amount: 220.0),
        Expenditure(date: Date().addingTimeInterval(-86400 * 2), storeName: "storename", amount: 170.0),
        Expenditure(date: Date().addingTimeInterval(-86400), storeName: "storename", amount: 190.0),
        Expenditure(date: Date(), storeName: "storename", amount: 210.0)
    ]

    
    var sortedData: [Expenditure] {
        return data.sorted {
            $0.date < $1.date
        }
    }
    
    var largestExpenditure: Double {
        return data.map { $0.amount }.max() ?? 0
    }
    
    var body: some View {
        CardView(title: "Sean’s Expenditure") {
            HStack {
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
                
                VStack {
                    Button("Scan Receipt") {
                        
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    ExpenditureCardView()
}
