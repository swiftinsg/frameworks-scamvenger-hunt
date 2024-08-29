//
//  HintCardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct HintCardView: View {
    
    var hint: Hint
    
    var body: some View {
        CardView(title: "Next Location Hint") {
            ZStack {
                if let text = hint.text {
                    Text(text)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .lineLimit(7)
                        .frame(maxHeight: .infinity, alignment: .top)
                }
                
                if let image = hint.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: hint.imageAlignment)
                }
            }
            
            Button("I’ve Arrived") {
                
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
