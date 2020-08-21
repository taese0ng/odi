//
//  ContentView.swift
//  odi
//
//  Created by taese0ng on 2020/07/23.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var Selected:Int = 1
    
    var body: some View {
        TabView(selection: $Selected){
            Home(Selection: $Selected)
            .tabItem {
                Image(systemName: "house.fill")
                if(Selected == 1){
                    Text("Home")
                }
            }.tag(1)
            
            Surrounding()
            .tabItem {
                Image(systemName:"location.fill")
                if(Selected == 2){
                    Text("내주변")
                }
            }.tag(2)
            
            Location()
            .tabItem{
                Image(systemName: "map.fill")
                if(Selected == 3){
                    Text("지역")
                }
            }.tag(3)
            
            Like()
            .tabItem{
                Image(systemName: "heart.fill")
                if(Selected == 4){
                    Text("좋아요")
                }
            }.tag(4)
            
            MyPage()
            .tabItem{
                Image(systemName: "person.crop.circle.fill")
                if(Selected == 5){
                    Text("My")
                }
            }.tag(5)
        }.accentColor(Color("Brown"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
