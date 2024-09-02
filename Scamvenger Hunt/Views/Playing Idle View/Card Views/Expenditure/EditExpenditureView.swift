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
                        TextField("Total Amount", value: $total, format: .currency(code: "SGD"))
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
    }
}
