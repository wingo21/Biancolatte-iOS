//
//  ContentView.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//

import SwiftUI

struct MapsView: View {
    
    var body: some View {
        ZStack {
            //Imposto il colore di tutto lo schermo a PrimaryColor
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("MapsView")
            }
            .padding()
        }
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
