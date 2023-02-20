//
//  Components.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 14/02/23.
//

import Foundation
import SwiftUI
import MapKit

class Components {

}

// Select which font to use
func getFont(size: CGFloat, font: Int) -> Font {
    // Ultra Thic
    if font == 1 {
        return Font.custom("MADEOuterSans-Black", size: size)
    }
    // Thic
    else if font == 2 {
        return Font.custom("MADEOuterSans-Bold", size: size)
    }
    // Subtitle
    else if font == 3 {
        return Font.custom("MADEOuterSans-Light", size: size)
    }
    // Title
    else if font == 4 {
        return Font.custom("MADEOuterSans-Medium", size: size)
    }
    // Regular
    else if font == 5 {
        return Font.custom("MADEOuterSans", size: size)
    }
    // Standard
    return Font.custom("MADEOuterSans-Thin", size: size)
}

// This are the function to use on Text to apply the fonts
extension Text {
    
    func ultraThic() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 1))
        }
    
    func thic() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 2))
        }
    
    func subtitle() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 3))
        }
    
    func title() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 4))
        }
    
    func regular() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 5))
        }
    
    func standard() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 0))
        }
    
    func mapFont() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
            .font(getFont(size: 13, font: 5))
            .multilineTextAlignment(.center)
            .fixedSize()
    }
}

// This allows us to swith between dark and light version of images, such as logos and writings throught the app
struct AdaptiveImage: View {
    @Environment(\.colorScheme) var colorScheme
    let light: Image
    let dark: Image

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light.resizable()
                .scaledToFit()
        } else {
            dark.resizable()
                .scaledToFit()
        }
    }
}

// Action component used on the maps menu opened when a location is tapped
struct Action: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let handler: () -> Void
}

// This struct defines the Locations as objects, so that future locations will be easy to add
struct BLLocation: Identifiable {
    let id = UUID()
    let name: String
    let placemark: String
    let coordinate: CLLocationCoordinate2D
    let website: URL?
    let google: URL?
}

class MapController: ObservableObject {
    @Published var isLocationViewShowing = false
    @Published private(set) var location = [BLLocation]()
    @Published private(set) var selectedLocation: BLLocation?
    @Published private(set) var actions = [Action]()
    
    init() {
        createActions()
    }
    
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.74289139001299, longitude: -73.97300144703335), latitudinalMeters: 7500, longitudinalMeters: 7500)
    
    var selectedLocationName: String {
        guard let selectedLocation = selectedLocation else { return "" }
        return selectedLocation.name
    }
    
    var selectedLocationPlacemark: String {
        guard let selectedLocation = selectedLocation else { return "??" }
        return selectedLocation.placemark
    }
    
    func openMap(coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
    }
    
    func setSelectedLocation(for location: BLLocation) {
        selectedLocation = location
        isLocationViewShowing.toggle()
    }
    
    func createActions() {
        actions = [
            Action(title: "Maps", image: "car.fill") { [weak self] in
                guard let self = self else { return }
                self.openMap(coordinate: self.selectedLocation!.coordinate)
            },
            Action(title: "Website", image: "safari.fill") { [weak self] in
                guard let self = self else { return }
                guard let website = self.selectedLocation?.website else { return }
                UIApplication.shared.open(website)
            },
            Action(title: "Google", image: "magnifyingglass.circle.fill") { [weak self] in
                guard let self = self else { return }
                guard let google = self.selectedLocation?.google else { return }
                UIApplication.shared.open(google)
            }
        ]
    }
}
