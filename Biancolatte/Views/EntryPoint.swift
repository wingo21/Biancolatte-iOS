//
//  EntryPoint.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 10/02/23.
//

import SwiftUI

struct EntryPoint: View {
    
    @State var selection = UserDefaults.standard.integer(forKey: "mainview_selection")
    
    var body: some View {
        VStack{
            TabView(selection: $selection) {
                VStack{
                    HomeView()
                }.tabItem {
                    Image(systemName: "house")
                        .resizable()
                        //.accentColor(Color("revogen_color"))
                    Text("Casa")
                }.tag(1)

                VStack{
                    UnknownView()
                }
                .tabItem {
                    //TODO: IMMAGINE DEL LEONE DI BIANCOLATTE COME ICONA
                        Image(systemName: "map")
                    Text("Trovaci")
                }.tag(2)
                
                VStack{
                    MapsView()
                }
                .tabItem {
                        Image(systemName: "square")
                    Text("Sconosciuto")
                }.tag(3)
                
                VStack(spacing: 0){
                    ProfileView()//.environmentObject(userAuth)
                }
                .tabItem {
                        Image(systemName: "person")
                    Text("Profilo")
                }.tag(4)
                
            }//.accentColor(Color("revogen_color"))
        }
    }
}

struct EntryPoint_Previews: PreviewProvider {
    static var previews: some View {
        EntryPoint()
    }
}
