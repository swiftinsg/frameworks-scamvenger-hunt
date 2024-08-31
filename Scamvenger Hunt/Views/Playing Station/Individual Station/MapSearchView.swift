//
//  MapSearchView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import MapKit

struct MapSearchView: View {
    
    @Environment(MapData.self) private var mapData
    
    @State private var locationSearchQuery = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.tint)
                    
                    TextField("Search Locations", text: $locationSearchQuery)
                        .onSubmit {
                            mapData.searchLocation(query: locationSearchQuery)
                        }
                }
                
                Button("Search") {
                    mapData.searchLocation(query: locationSearchQuery)
                }
            }
            .padding()
            .onAppear {
                mapData.locationResults = []
            }
            
            if mapData.locationResults.isEmpty {
                ContentUnavailableView("Search to find locations", systemImage: "magnifyingglass")
            } else {
                List {
                    ForEach(mapData.locationResults, id: \.placemark.coordinate.latitude) { location in
                        Button {
                            withAnimation {
                                mapData.userLocations.append(location)
                                dismiss()
                            }
                        } label: {
                            VStack(alignment: .leading) {
                                Text(location.name ?? "No Title")
                                    .fontWeight(.bold)
                                Text(location.placemark.thoroughfare ?? "No Address")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
    }
}
