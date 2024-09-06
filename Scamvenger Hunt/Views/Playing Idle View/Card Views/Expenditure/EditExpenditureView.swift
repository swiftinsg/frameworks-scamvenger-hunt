//
//  EditExpenditureView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 02/09/2024.
//

import SwiftUI

struct EditExpenditureView: View {
    
    @Binding var storeName: String
    @Binding var date: Date
    @Binding var total: Double
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    @State private var amountText = ""
    @State private var previousValue = ""
    
    var body: some View {
            VStack {
                VStack(spacing: 15) {
                    LabeledContent {
                        TextField("Store Name", text: $storeName)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        Text("Store Name")
                            .fontWeight(.bold)
                            .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    LabeledContent {
                        DatePicker("", selection: $date, displayedComponents: .date)
                            .labelsHidden()
                            .id(date)
                    } label: {
                        Text("Date")
                            .fontWeight(.bold)
                            .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    LabeledContent {
                        TextField("Total Amount", text: $amountText) {
                            let number = formatter.string(for: total)!
                            amountText = number
                        }
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                    } label: {
                        Text("Total Amount")
                            .fontWeight(.bold)
                            .padding(.horizontal)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(.tint.opacity(0.1))
            .clipShape(.rect(cornerRadius: 16))
            .padding(.vertical, 30)
            .onAppear {
                var amount = String(format: "%.2f", total)
                amount = amount.replacingOccurrences(of: ",", with: "")
                amountText = amount
                previousValue = amount
            }
            .onChange(of: amountText) {
                if amountText.isEmpty {
                    total = 0
                    previousValue = amountText
                } else if let newNumber = Double(amountText) {
                    total = newNumber
                    previousValue = amountText
                } else {
                    amountText = previousValue
                }
            }
    }
}
