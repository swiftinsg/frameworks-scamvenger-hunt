//
//  MapData.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import Foundation
import Observation
import MapKit

@Observable
class MapData {
    
    var userLocations: [MKMapItem] = [] {
        didSet {
            Task {
                for index in (1..<userLocations.count) {
                    await getRoute(from: userLocations[index - 1], to: userLocations[index])
                }
            }
        }
    }
    
    var userLocationRoutePaths: [String] {
        if userLocations.count < 2 {
            return []
        }
        
        return (1..<userLocations.count).map { index in
            getRouteId(from: userLocations[index - 1], to: userLocations[index])
        }
    }
    
    var routesOnly: [MKRoute] {
        Array(routes.filter {
            userLocationRoutePaths.contains($0.key)
        }.values)
    }
    
    var routes: [String: MKRoute] = [:]
    
    private var locationSearchTask: Task<Void, Never>?
    
    var locationResults: [MKMapItem] = []
    
    func searchLocation(query: String) {
        locationSearchTask?.cancel()
        
        locationSearchTask = Task {
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = query
            searchRequest.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.326552201722226, longitude: 103.81816571483735),
                                                      span: MKCoordinateSpan(latitudeDelta: 0.371424832622929, longitudeDelta: 0.456988498626302))
            
            let search = MKLocalSearch(request: searchRequest)
            
            let response = try? await search.start()
            
            self.locationResults = response?.mapItems ?? []
        }
    }
    
    func getRoute(from source: MKMapItem, to destination: MKMapItem) async -> MKRoute? {
        
        let id = getRouteId(from: source, to: destination)
        
        if let route = routes[id] {
            return route
        }
        
        let request = MKDirections.Request()
        request.source = source
        request.destination = destination
        
        let directions = MKDirections(request: request)
        
        let response = try? await directions.calculate()
        
        let route = response?.routes.first
        
        routes[id] = route
        
        return route
    }
    
    func getRouteId(from source: MKMapItem, to destination: MKMapItem) -> String {
        "\(source.placemark.coordinate.latitude),\(source.placemark.coordinate.longitude),\(destination.placemark.coordinate.latitude),\(destination.placemark.coordinate.longitude)"
    }
}
