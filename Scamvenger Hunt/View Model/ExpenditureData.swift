//
//  ExpenditureData.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import SwiftUI

@Observable
class ExpenditureData {
    
    var expenditures: [Expenditure] = [
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
    
    var sortedExpenditures: Binding<[Expenditure]> {
        return .constant(self.expenditures.sorted { $0.date < $1.date })
    }
    
    func addExpenditure(expenditure: Expenditure) {
        self.expenditures.insert(expenditure, at: 0)
    }
}
