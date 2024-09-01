//
//  ConfirmNewExpenditureView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import SwiftUI

struct ConfirmNewExpenditureView: View {
    
    @Binding var storeName: String
    @Binding var date: Date
    @Binding var total: Double
    
    @Environment(\.dismiss) private var dismiss
    @Environment(ExpenditureData.self) private var expenditureData
    @Environment(Game.self) private var game
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Add new ")
                Text("Expenditure")
                    .background(.tint.opacity(0.4))
            }
            .font(.title)
            .fontWeight(.bold)
            
            Text("Ensure that the Store Name, Date, and Total Amount is correct. Edit the information if necessary.")
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Divider()
            VStack {
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
                } label: {
                    Text("Date")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                }
                
                Divider()
                
                LabeledContent {
                    TextField("Total", value: $total, format: .currency(code: "SGD"))
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                } label: {
                    Text("Total")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                }
            }
            Divider()
            
            Spacer()
            
            Button {
                expenditureData.addExpenditure(expenditure: Expenditure(date: date, storeName: storeName, amount: total))
                dismiss()
                if expenditureData.expenditures.count == 10 {
                    game.stationCompleted(.swiftCharts)
                }
            } label: {
                Text("Add Expenditure")
                    .padding(10)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(30)
    }
}
