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
        NavigationSplitView {
            Text("Hello")
                .navigationTitle("Groups")
        } content: {
            VStack {
                Text("Map")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                MapView()
            }
            .padding()
            .navigationTitle("Scamvenger Server")
        } detail: {
            VSplitView {
                VStack {
                    Text("Assignment Requests")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding([.top, .horizontal])
                        .frame(maxWidth: .infinity, alignment: .leading)
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
                
                VStack(alignment: .leading) {
                    Text("Logs")
                        .font(.title3)
                        .fontWeight(.bold)
                    ScrollView {
                        Text("AAA")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .monospaced()
                    }
                }
                .padding()
            }
        }
        .environment(communication)
    }
}

#Preview {
    ContentView()
}
