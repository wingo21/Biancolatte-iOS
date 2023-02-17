//
//  ContentView.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//
//  MapView provides a map that shows all Biancolatte Locations

import SwiftUI
import MapKit

// This struct defines the Locations as object, so that future locations will be easy to add
struct BLLocation: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

// This is the list of Locations, to add a new one create a new BLLocation object, specifiying name and coordinates (grab from GMaps)
let PointsOfInterest = [
        BLLocation(name: "Williamsburg", coordinate: CLLocationCoordinate2D(latitude: 40.72023577087259, longitude: -73.95517017329159)),
        BLLocation(name: "Hudson Yards", coordinate: CLLocationCoordinate2D(latitude: 40.75349031717275, longitude: -74.00100907329055))
]

struct MapsView: View {
    
    //  CLLocationCoordinate2D: Coordinates of the place, just go on google maps, right click on point of interest and copy paste coordinates.
    //  LatitudinalMeters and LongitudinalMeters: How zoomed in you want to be. Higher values zooms out
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.74289139001299, longitude: -73.97300144703335), latitudinalMeters: 7500, longitudinalMeters: 7500)
    
    var body: some View {
        
        ZStack {
            //Screen color set to PrimaryColor
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Our Locations").title()
                Map(coordinateRegion: $region, annotationItems: PointsOfInterest) { item in
                    //TODO: Al momento un bug di Xcode crea una pioggia di warning ogni volta che si fa qualcosa sulla mappa, non sembra che causino crash dell'app o altro. Bisogna aspettare un'aggiornamento come unica soluzione a quanto pare
                    MapAnnotation(coordinate: item.coordinate) {
                        VStack {
                            // TODO: Icona Biancolatte rimane troppo piccola
                            Image("MapIcon")
                            Text(item.name).fixedSize().font(.footnote)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            
        }
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
