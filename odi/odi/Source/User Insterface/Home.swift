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
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            
            MyLoaction()
                .tabItem {
                    Image(systemName:"location.fill")
                    Text("내주변")
            }
            
            MyLoaction()
                .tabItem{
                    Image(systemName: "map.fill")
                    Text("map")
            }
            
            MyLoaction()
                .tabItem{
                    Image(systemName: "heart.fill")
                    Text("Favorite")
            }
            
            MyLoaction()
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
                    Text("info")
            }
        }
    }
}

struct HomeView: View{
    var body: some View{
        VStack{
            HStack{
                Text("ODI").frame(maxWidth: .infinity, alignment: .leading).font(.title)
            }
            Image("cafeImg").resizable()
                .aspectRatio(contentMode: .fit)
            Button("Button"){
                print("Button1")
            }
            
            Text("이번 주 HOT 카페").frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
        }.frame(minWidth:0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
}


struct MyLoaction: View{
    var body: some View{
        VStack{
            HStack{
                Text("ODI").frame(maxWidth: .infinity, alignment: .leading).font(.title)
            }
            Image("cafeImg").resizable()
                .aspectRatio(contentMode: .fit)
            Button("Button"){
                print("Button1")
            }
            
            Text("이번 주 HOT 카페").frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
        }.frame(minWidth:0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
