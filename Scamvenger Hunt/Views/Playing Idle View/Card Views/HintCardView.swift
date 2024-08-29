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
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
                
                if let image = hint.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: hint.imageAlignment)
                        .padding(-16)
                }
                
                Button("I’ve Arrived") {
                    
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
        }
    }
}
