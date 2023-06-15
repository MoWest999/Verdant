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
    let address: String
    let cityStateZip: String
    let phone: String
    let web: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0857), span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4))
    
    // Step2 Array of locations to appear on map:
    let locations = [
        Location(name: "Detroit Dirt",
            address:"",
            cityStateZip: "Detroit, MI  48216",
            phone:"(313) 397-1613",
            web:"detroitdirt.org",
            coordinate: CLLocationCoordinate2D(latitude: 42.3293, longitude: -83.0876)),
        Location(name: "Midtown Composting Recycling Center", address: "4272 Alter Road",
            cityStateZip: "Detroit, MI  48215",
            phone: "(313) 777-2323",
            web: "https://midtowncomposting.com",
            coordinate: CLLocationCoordinate2D(latitude: 42.391, longitude: -82.9505)),
        Location(name: "D-Town Farm (DBCFSN)",
            address:"14027 Outer Dr W.",
            cityStateZip: "Detroit, MI  48228",
            phone:"(313) 345-3663",
            web:"https://www.dbcfsn.org/dtownfarm2022",
                 coordinate: CLLocationCoordinate2D(latitude: 42.367780, longitude: -83.260570))
            //coordinate: CLLocationCoordinate2D(latitude: 42.36732, longitude: -83.26023))
    ]
    
    var body: some View {
        NavigationView {
            //Step3 Feeds array into map view and then provides physical representation:
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                        Text(location.address)
                        Text(location.cityStateZip)
                        Text(location.phone)
                        Text(location.web)
                    } label: {
                        Circle()
                            .stroke(.green, lineWidth: 4)
                            .frame(width: 40, height: 40)
                    }
                }
            }
            //.navigationTitle("Composting Sites")
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
