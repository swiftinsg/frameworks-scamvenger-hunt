//
//  MapKitView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import MapKit

struct MapKitView: View {
    
    @State private var route: MKRoute?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text("Sean's ")
                Text("Stolen")
                    .background(.tint.opacity(0.2))
                Text(" $oon")
            }
            .font(.title3)
            .fontWeight(.medium)
            
            HStack {
                Text("Trace His Moves")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.tint)
                
                Spacer()
                
                Text(Date.now, style: .date)
                    .foregroundStyle(.secondary)
            }
            
            HStack {
                VStack {
                    ForEach(0..<8) { _ in
                        Divider()
                        
                        Rectangle()
                            .fill(.clear)
                    }
                }
                
                Map(position: .constant(.automatic), selection: .constant(nil)) {
                    MapPolyline(coordinates: [.init(latitude: 1.298077, longitude: 103.788628),
                                              .init(latitude: 1.299072, longitude: 103.845051)],
                                contourStyle: .geodesic)
                    
                    if let route {
                        MapPolyline(route)
                            .stroke(.blue, lineWidth: 5)
                    }
                    
                    Marker("Apple", coordinate: .init(latitude: 1.298077, longitude: 103.788628))
                    Marker("Dhoby Ghaut", coordinate: .init(latitude: 1.299072, longitude: 103.845051))
                }
            }
            .task {
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: MKPlacemark(coordinate: .init(latitude: 1.298077, longitude: 103.788628)))
                request.destination = MKMapItem(placemark: MKPlacemark(coordinate: .init(latitude: 1.299072, longitude: 103.845051)))
                
                let directions = MKDirections(request: request)
                let response = try? await directions.calculate()
                route = response?.routes.first
            }
        }
        .padding()
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    MapKitView()
}
