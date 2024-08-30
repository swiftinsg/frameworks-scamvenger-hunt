//
//  ContentView.swift
//  ScamvengerServer
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var communication = Communication()
    
    var body: some View {
        HSplitView {
            MapView()
            
            List {
                
                ForEach(communication.allRequests.sorted(by: {
                    $0.date < $1.date
                }).filter({
                    $0.response == nil
                })) { request in
                    RequestRowView(request: request)
                }
            }
        }
        .padding()
        .environment(communication)
    }
}

#Preview {
    ContentView()
}
