//
//  ContentView.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//

import SwiftUI

struct UnknownView: View {
    
    var body: some View {
        ZStack {
            //Screen color set to PrimaryColor
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("UnknownView")
            }
            .padding()
        }
    }
}

struct UnknownView_Previews: PreviewProvider {
    static var previews: some View {
        UnknownView()
    }
}
