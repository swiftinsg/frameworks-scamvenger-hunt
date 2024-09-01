//
//  ExpenditureListView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 01/09/2024.
//

import SwiftUI

struct ExpenditureListView: View {
    
    @EnvironmentObject var expenditureData: ExpenditureData
    
    var body: some View {
        List {
            ForEach(expenditureData.expenditures) { data in
                HStack {
                    VStack(alignment: .leading) {
                        Text(data.storeName)
                        Text(data.date.formatted(date: .abbreviated, time: .omitted))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text("$\(data.amount, specifier: "%.2f")")
                }
                .listRowBackground(Color.accentColor.opacity(0.25))
            }
            .onDelete { indexSet in
                withAnimation {
                    expenditureData.removeExpenditure(atOffsets: indexSet)
                }
            }
        }
        .listStyle(.plain)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .scrollIndicators(.never)
        .scrollContentBackground(.hidden)
        .padding(.horizontal)
        .padding(.top, -15)
    }
}
