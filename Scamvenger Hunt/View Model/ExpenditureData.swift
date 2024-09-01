//
//  ExpenditureData.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import SwiftUI

class ExpenditureData: ObservableObject {
    
    var expenditures: [Expenditure] = []

    func addExpenditure(expenditure: Expenditure) {
        withAnimation {
            self.expenditures.append(expenditure)
            self.expenditures.sort(by: { $0.date > $1.date })
        }
    }
}
