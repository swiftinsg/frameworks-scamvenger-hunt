//
//  RequestRowView.swift
//  ScamvengerServer
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct RequestRowView: View {
    
    @Environment(Communication.self) private var communication
    
    var request: InputRequest
    @State private var selectedStation: Station?
    
    var body: some View {
        VStack {
            HStack {
                Text("Group \(request.group)")
                Spacer()
                Text(request.date, style: .offset)
                    .foregroundStyle(.secondary)
            }
            .font(.headline)
            
            HStack {
                Picker("Choose a Station", selection: $selectedStation) {
                    ForEach(Station.allCases, id: \.rawValue) { station in
                        Text(station.rawValue)
                            .tag(station)
                    }
                }
                
                Button("Assign") {
                    switch request.group {
                    case 1: communication.group1Request?.response = selectedStation
                    case 2: communication.group2Request?.response = selectedStation
                    case 3: communication.group3Request?.response = selectedStation
                    case 4: communication.group4Request?.response = selectedStation
                    case 5: communication.group5Request?.response = selectedStation
                    case 6: communication.group6Request?.response = selectedStation
                    case 7: communication.group7Request?.response = selectedStation
                    case 8: communication.group8Request?.response = selectedStation
                    default: communication.group8Request?.response = selectedStation
                    }
                }
                .disabled(selectedStation == nil)
            }
        }
    }
}
