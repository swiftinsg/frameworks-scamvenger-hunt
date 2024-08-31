//
//  MapKitView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI
import MapKit

struct MapKitView: View {
    
    @Environment(Game.self) private var game
    
    @State private var mapData = MapData()
    
    @State private var route: MKRoute?
    @State private var isMapSearchViewPresented = false

    @State private var isErrorPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
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
                    
                    VStack(alignment: .trailing) {
                        Button("Done") {
                            if mapData.locationResults.count >= 6 {
                                game.stationCompleted(.mapKit)
                            } else {
                                isErrorPresented = true
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Text(Date.now, style: .date)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(.leading)
            
            HStack {
                VStack {
                    HStack {
                        Button("Add Location") {
                            isMapSearchViewPresented.toggle()
                        }
                        .foregroundStyle(.tint)
                        .fontWeight(.bold)
                        
                        Spacer()
                        
                        EditButton()
                    }
                    .padding(.leading)
                    
                    List {
                        ForEach(mapData.userLocations, id: \.placemark.coordinate.latitude) { location in
                            VStack(alignment: .leading) {
                                Text(location.name ?? "No Title")
                                    .fontWeight(.bold)
                                Text(location.placemark.thoroughfare ?? "No Address")
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .onMove { indexSet, offset in
                            mapData.userLocations.move(fromOffsets: indexSet, toOffset: offset)
                        }
                        .onDelete { indexSet in
                            mapData.userLocations.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(.plain)
                }
                
                Map(position: .constant(.automatic), selection: .constant(nil)) {
                    ForEach(mapData.userLocations, id: \.placemark.coordinate.latitude) { location in
                        Marker(item: location)
                    }
                    
                    ForEach(mapData.routesOnly, id: \.name) { route in
                            MapPolyline(route)
                                .stroke(.blue, lineWidth: 5)
                    }
                }
            }
        }
        .padding([.trailing, .vertical])
        .ignoresSafeArea(.keyboard)
        .sheet(isPresented: $isMapSearchViewPresented) {
            MapSearchView()
        }
        .alert("Incorrect Information", isPresented: $isErrorPresented) {
            Button("Try Again") {}
        }
        .environment(mapData)
    }
}

#Preview {
    MapKitView()
}
