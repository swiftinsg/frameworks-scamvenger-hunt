//
//  ExpenditureData.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import SwiftUI

class ExpenditureData: ObservableObject {
    
    var expenditures: [Expenditure] = []

    func addExpenditure(expenditures: [Expenditure]) {
        withAnimation {
            self.expenditures.append(contentsOf: expenditures)
            self.expenditures.sort(by: { $0.date > $1.date })
        }
    }
}
