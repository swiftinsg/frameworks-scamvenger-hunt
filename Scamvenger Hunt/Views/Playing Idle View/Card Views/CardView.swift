//
//  CardView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI

struct CardView<Content: View>: View {
    
    var title: String
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title.uppercased())
                .font(.headline)
                .foregroundStyle(.tint)
            
            content()
        }
        .padding()
        .background(.tint.opacity(0.1))
        .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    CardView(title: "Hint") {
        Text("Hello")
    }
}
