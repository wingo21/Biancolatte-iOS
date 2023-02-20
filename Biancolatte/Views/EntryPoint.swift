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
    @StateObject var mapController = MapController()
    
    //Setting visual appearence of TabBar
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("SecondaryColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("TabBarIconColor"))
    }
    
    var body: some View {
        
        VStack{
            TabView {
                HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

                MapsView(mapController: MapController())
                .tabItem {
                    Label("Find Us", systemImage: "map")
                }
                
                UnknownView()
                .tabItem {
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
