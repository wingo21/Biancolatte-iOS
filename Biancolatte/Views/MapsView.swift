//
//  ContentView.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//
//  MapView provides a map that shows all Biancolatte Locations

import SwiftUI
import MapKit

//  This is the list of Locations, to add a new one create a new BLLocation object, specifiying name, placemark, coordinates and website link. Placemark and coordinates is basically the same information but it's needed for different scopes, grab coordinates of Location from Google Maps
let PointsOfInterest = [
        BLLocation(name: "Biancolatte Williamsburg", placemark: "109 Bedford Ave, Brooklyn, NY 11249", coordinate: CLLocationCoordinate2D(latitude: 40.72005671926065, longitude: -73.95512368052952), website: URL(string: "http://biancolatte.nyc/"), google: URL(string: "https://goo.gl/maps/77afeDDPVZNVdmov8"), locationImage: Image("HudsonYards")),
        BLLocation(name: "Biancolatte Hudson Yards", placemark: "20 Hudson Yards c/o Ana Bar and Eatery, New York, NY 10001", coordinate: CLLocationCoordinate2D(latitude: 40.75349031717275, longitude: -74.00100907329055), website: URL(string: "http://biancolatte.nyc/"), google: URL(string: "https://goo.gl/maps/stiJEtbLRFUXPnCt9"), locationImage: Image("HudsonYards"))
]

struct MapsView: View {
    
    //  MapController allows us to add a menu with useful links when a location is tapped
    @ObservedObject var mapController: MapController
    
    var body: some View {
        
        ZStack {
            //  Screen color set to PrimaryColor
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Our Locations").title()
                Map(coordinateRegion: $mapController.region, annotationItems: PointsOfInterest) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            //  TODO: Icona Biancolatte rimane troppo piccola
                            Image("MapIcon")
                            Text(location.name).mapFont()
                        }.onTapGesture {
                            //  Make menu appear when location is tapped
                            mapController.setSelectedLocation(for: location)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented: $mapController.isLocationViewShowing) {
                LocationView(mapController: mapController)
                //  TODO: Non sistema la grandezza su ipad, rimane un quadrato enorme oltre il contenuto, forse si puo fare qualcosa?
                    .presentationDetents([.fraction(0.40)])
            }
        }
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView(mapController: MapController())
    }
}
