//
//  ContentView.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//
//  Purpouse still to be decided

import SwiftUI

struct UnknownView: View {
    
    var body: some View {
        ZStack {
            //Screen color set to PrimaryColor
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Ultra Thic").ultraThic()
                Text("Thic").thic()
                Text("Title").title()
                Text("Subtitle").subtitle()
                Text("Regular").regular()
                Text("Standard").standard()
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
