//
//  Home.swift
//  odi
//
//  Created by taese0ng on 2020/07/23.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct MenuBtns: View{
    var screenWidth = UIScreen.main.bounds.size.width
    var screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View{
        VStack{
            HStack(spacing: 0){
                Button("Button"){}
                    .frame(width:screenWidth/4.5, height:screenWidth/4.5)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                Button("Button"){}
                    .frame(width:screenWidth/4.5, height:screenWidth/4.5)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                    .frame(width:screenWidth/4.5, height:screenWidth/4.5)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                    .frame(width:screenWidth/4.5, height:screenWidth/4.5)
                .background(Color.blue)
                .foregroundColor(Color.white)
                }.frame(maxWidth: .infinity)
            
            HStack(spacing: 0){
                Button("Button"){}
                    .frame(width:screenWidth/4.5, height:screenWidth/4.5)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                .frame(width:screenWidth/4.5, height:screenWidth/4.5)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                .frame(width:screenWidth/4.5, height:screenWidth/4.5)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                .frame(width:screenWidth/4.5, height:screenWidth/4.5)
                .background(Color.blue)
                .foregroundColor(Color.white)
            }
        }
    }
}

struct HotCafe:View{
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach((1...5).reversed(), id:\.self){_ in
                    Image("cafeImg")
                }
            }
        }
    }
}

struct RecentCafe:View{
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach((1...5).reversed(), id:\.self){_ in
                    Image("cafeImg")
                }
            }
        }
    }
}

struct Home: View{
    var body: some View{
        NavigationView{
            VStack{
                ScrollView{
                    TopBar(title:"ODI")
                    Image("cafeImg").resizable()
                        .aspectRatio(contentMode: .fit)
                    MenuBtns()
                    
                    Text("이번 주 HOT 카페")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                    HotCafe()
                    
                    Text("최근 본 카페")
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .font(.title)
                    RecentCafe()
                }
            }.frame(minWidth:0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarColor(.white)

//            .navigationBarTitle("")
//            .navigationBarHidden(self.store.isNavigationBarHidden)
//            .onAppear(){
//                self.store.isNavigationBarHidden=true
//            }
//            .onDisappear(){
//                self.store.isNavigationBarHidden=false
//            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
