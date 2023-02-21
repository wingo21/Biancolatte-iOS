//
//  LocationView.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 20/02/23.
//

import Foundation
import SwiftUI

struct LocationView: View {
    @ObservedObject var mapController: MapController
    
    var body: some View {
        ZStack {
            //  Screen color set to PrimaryColor
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(mapController.selectedLocationName)
                            .title()
                        Text(mapController.selectedLocationPlacemark)
                            .standard()
                    }
                    
                    Spacer()
                    
                    Button {
                        mapController.isLocationViewShowing.toggle()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("SecondaryColor"))
                    }
                }
                
                //  This will display an image relative to the location, currently still to be decided if it will be included
//                VStack(alignment: .leading) {
//                    mapController.selectedLocation!.locationImage
//                        .resizable()
//                        .scaledToFit()
//                        .cornerRadius(15)
//                }.padding()
                
                HStack {
                    ForEach(mapController.actions) { action in
                        Button {
                            action.handler()
                        } label: {
                            VStack {
                                Image(systemName: action.image)
                                Text(action.title).actionButton()
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(Color("SecondaryColor"))
                    }
                }
            }
            .padding()
        }
    }
}

struct LocationView_Preview: PreviewProvider {
    static var previews: some View {
        LocationView(mapController: MapController())
    }
}
