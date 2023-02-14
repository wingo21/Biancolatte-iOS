//
//  ContentView.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//

import SwiftUI
import MapKit

// This struct defines the Locations as object, so that future locations will be easy to add
struct BLLocation: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

// This extention defines the list of locations to mark up on the map, adding an object on this list will add another location on the map
extension BLLocation {
    static var POI: [BLLocation] {
        [
            BLLocation(name: "Williamsburg Location", coordinate: CLLocationCoordinate2D(latitude: 40.72023577087259, longitude: -73.95517017329159)),
            BLLocation(name: "Hudson Yards Location", coordinate: CLLocationCoordinate2D(latitude: 40.75349031717275, longitude: -74.00100907329055))
        ]
    }
}

struct MapsView: View {
    
    //  CLLocationCoordinate2D: Coordinates of the place, just go on google maps, right click on point of interest and copy paste coordinates.
    //  LatitudinalMeters and LongitudinalMeters: How zoomed in you want to be. Higher values zooms out
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.74289139001299, longitude: -73.97300144703335), latitudinalMeters: 7500, longitudinalMeters: 7500)
    
    var body: some View {
        ZStack {
            //Screen color set to PrimaryColor
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Le nostre location")
                Map(coordinateRegion: $region, annotationItems: BLLocation.POI) { item in
                    MapAnnotation(coordinate: item.coordinate) {
                        ZStack {
                            // TODO: Icona Biancolatte come marker
                            Image(systemName: "flag.circle.fill")
                                .font(.largeTitle)
                            
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
