//
//  StyledPage.swift
//  Scamvenger Accessibility
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct StyledPage<Content: View>: View {
    
    var title: String
    var subtitle: String = ""
    var date: Date = Date()
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.tint)
                    if !subtitle.isEmpty {
                        Text(subtitle)
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                }
                
                
                Spacer()
                
                Text("Meeting held on: \(date.formatted(date: .long, time: .omitted))")
                    .foregroundStyle(.secondary)
            }
            .padding()
            
            Divider()
            
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
    }
}
