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
                
                AdaptiveImage(light: Image("LionDark"), dark: Image("LionLight")).frame(width: 200, height: 200)

                Spacer()
  
                AdaptiveImage(light: Image("NameDark"), dark: Image("NameLight")).frame(width: 350, height: 200)
                
                Spacer()
                
                AdaptiveImage(light: Image("OvalHollowDark"), dark: Image("OvalHollowLight")).frame(width: 200, height: 200)
                
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
