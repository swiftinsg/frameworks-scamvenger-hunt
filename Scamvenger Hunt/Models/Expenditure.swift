//
//  Expenditure.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import Foundation

struct Expenditure: Identifiable {
    let id = UUID()
    var date: Date
    var storeName: String
    var amount: Double
}
