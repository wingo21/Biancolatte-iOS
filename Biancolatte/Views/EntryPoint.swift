//
//  EntryPoint.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//
//  EntryPoint manages the TabBar, acts as a starting point and hub for all other views

import SwiftUI

struct EntryPoint: View {
    
    @State var selection = UserDefaults.standard.integer(forKey: "mainview_selection")
    
    //Setting visual appearence of TabBar
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("SecondaryColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("TabBarIconColor"))
    }
    
    var body: some View {
        
        VStack{
            TabView(selection: $selection) {
                HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

                MapsView()
                .tabItem {
                    Label("Find Us", systemImage: "map")
                }
                
                UnknownView()
                .tabItem {
                    // TODO: Chiedi alla cami di scalarla 40x40 altrimenti rimane sgranata
//                    Image("TabIconLion")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 40, height: 40)
                    Label("Unknown", image: "TabIconLion")
                }
                
                ProfileView()//.environmentObject(userAuth)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            }
        }
    }
}

struct EntryPoint_Previews: PreviewProvider {
    static var previews: some View {
        EntryPoint()
    }
}
