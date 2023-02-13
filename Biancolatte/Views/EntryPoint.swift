//
//  EntryPoint.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//

import SwiftUI

struct EntryPoint: View {
    
    @State var selection = UserDefaults.standard.integer(forKey: "mainview_selection")
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("SecondaryColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("TabBarIconColor"))
    }
    
    var body: some View {
        VStack{
            TabView(selection: $selection) {
                VStack{
                    HomeView()
                }.tabItem {
                    Image(systemName: "house")
                        .resizable()
                    Text("Casa")
                }

                VStack{
                    UnknownView()
                }
                .tabItem {
                    //TODO: IMMAGINE DEL LEONE DI BIANCOLATTE COME ICONA
                        Image(systemName: "map")
                    Text("Trovaci")
                }
                
                VStack{
                    MapsView()
                }
                .tabItem {
                        Image(systemName: "square")
                    Text("Sconosciuto")
                }
                
                VStack(spacing: 0){
                    ProfileView()//.environmentObject(userAuth)
                }
                .tabItem {
                        Image(systemName: "person")
                    Text("Profilo")
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
