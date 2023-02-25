//
//  ContentView.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//
//  HomeView is supposed to be the first screen the user sees when the app is opened.
//  Here we will display relevant news, limited-time offers and promotions

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            //  Screen color set to PrimaryColor
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            
            VStack {
                
                AdaptiveImage(light: Image("lionDark"), dark: Image("lionLight")).frame(width: 200, height: 200)

                Spacer()
  
                AdaptiveImage(light: Image("nameDark"), dark: Image("nameLight")).frame(width: 350, height: 200)
                
                Spacer()
                
                AdaptiveImage(light: Image("ovalHollowDark"), dark: Image("ovalHollowLight")).frame(width: 200, height: 200)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
