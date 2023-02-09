//
//  ContentView.swift
//  Verdant
//
//  Created by Kevin A. Johnson on 2/8/23.
//

import MapKit
import SwiftUI

// Step1: This struct provides map markers on screen:
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0457), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    // Step2 Array of locations to appear on map:
    let locations = [
        Location(name: "Detroit Dirt", coordinate: CLLocationCoordinate2D(latitude: 42.3293, longitude: -83.0876)),
        Location(name: "Midtown Composting", coordinate: CLLocationCoordinate2D(latitude: 42.391, longitude: -82.9505)),
        Location(name: "D-Town Farm (DBCFSN)", coordinate: CLLocationCoordinate2D(latitude: 42.36732, longitude: -83.26023))
    ]
    
    var body: some View {
        NavigationView {
            //Step3 Feeds array into map view and then provides physical representation:
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.green, lineWidth: 4)
                            .frame(width: 40, height: 40)
                    }
                }
            }
            .navigationTitle("Composting Sites")
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            MapView()
        }
    }
}
