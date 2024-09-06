//
//  ContentView.swift
//  Scamvenger Accessibility
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ScamvengerPlanMinutes()
            Text("This is Page 2")
        }
        .tabViewStyle(.page)
    }
}

struct StyledPage<Content: View>: View {
    
    var title: String
    var subtitle: String = ""
    
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
                
                Text(Date.now.addingTimeInterval(-86400), style: .date)
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

struct ScamvengerPlanMinutes: View {
    var body: some View {
        StyledPage(title: "Scamvenger Meeting - Minutes", subtitle: "In Attendance: Sean, Shaun, Shawn, and Shon") {
            Text("hello")
        }
    }
}

#Preview {
    ContentView()
}
