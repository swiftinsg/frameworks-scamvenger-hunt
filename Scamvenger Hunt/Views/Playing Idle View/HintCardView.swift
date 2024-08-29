//
//  HintCardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct HintCardView: View {
    
    var hint: String
    
    var body: some View {
        CardView(title: "hint") {
            Text(hint)
                .font(.title)
                .multilineTextAlignment(.leading)
                .lineLimit(7)
            Spacer(minLength: 0)
            
            Button("I’ve Arrived") {
                
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    HintCardView(hint: "“Sean’s Credit Card” left behind\nThis item is no longer detected near you.\nIt was last seen near Dunearn Rd and Scotts Rd.")
}
