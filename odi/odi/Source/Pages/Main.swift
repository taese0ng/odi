//
//  ContentView.swift
//  odi
//
//  Created by taese0ng on 2020/07/23.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            Home()
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            Surrounding()
            .tabItem {
                Image(systemName:"location.fill")
                Text("내주변")
            }
            
            Location()
            .tabItem{
                Image(systemName: "map.fill")
                Text("지역")
            }
            
            Surrounding()
            .tabItem{
                Image(systemName: "heart.fill")
                Text("좋아요")
            }
            
            MyPage()
            .tabItem{
                Image(systemName: "person.crop.circle.fill")
                Text("My")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
