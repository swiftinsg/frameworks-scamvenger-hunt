//
//  ExpenditureCardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct ExpenditureCardView: View {
    var body: some View {
        CardView(title: "Sean’s Expenditure") {
            Button("Scan Receipt") {
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ExpenditureCardView()
}
