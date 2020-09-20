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
    @Binding var Selection : Int
    var menuImg1 = ["디저트","베이커리","브런치","애견동반"]
    var menuImg2 = ["주택개조,한옥", "루프탑", "뷰", "포토존"]
    
    var body: some View{
        VStack{
            HStack(spacing: 0){
                ForEach(menuImg1, id:\.self){item in
                    Button(action:{
                        self.Selection = 2
                    }){
                        VStack{
                            Image("\(item)")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            Text("\(item)")
                            .font(.caption)
                            .foregroundColor(Color.black)
                        }
                    }
                    .frame(width:self.screenWidth/4.5, height:self.screenWidth/4.5)
                }
            }
            HStack(spacing: 0){
                ForEach(menuImg2, id:\.self){item in
                    Button(action:{
                        self.Selection = 2
                    }){
                        VStack{
                            Image("\(item)")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            Text("\(item)")
                            .font(.caption)
                            .foregroundColor(Color.black)
                        }
                    }
                    .frame(width:self.screenWidth/4.5, height:self.screenWidth/4.5)
                }
            }
        }
        .padding(.vertical, 30)
    }
}

struct HotCafe:View{
    var screenWidth = UIScreen.main.bounds.size.width
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach((1...5).reversed(), id:\.self){item in
                    CafeCard(cafeName: String(item))
                }
            }.padding(.horizontal,8)
        }
    }
}

struct RecentCafe:View{
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach((1...5).reversed(), id:\.self){item in
                    CafeCard(cafeName: String(item))
                }
            }.padding(.horizontal,8)
        }
    }
}

struct BannerList: View{
    var body: some View{
        ScrollView{
            ForEach((1...5), id:\.self){
                item in CafeBanner()
            }
        }
    }
}

struct Home: View{
    @Binding var Selection:Int
    var body: some View{
        NavigationView{
            VStack{
                TopBar(title:"ODI")
                ScrollView{
                    //자동 가로 배너
                    GeometryReader { geometry in
                        Carousel(numberOfImages: 3) {
                            Image("cafeImg")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                            Image("rateReview")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                            Image("cafeImg")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                        }
                    }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                    
                    MenuBtns(Selection : $Selection)
                    
                    Text("이번 주 HOT 카페")
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                    HotCafe()
                        .padding(.horizontal, 12)
                    
                    Text("최근 본 카페")
                        .padding(.horizontal, 20)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .font(.title)
                    RecentCafe()
                        .padding(.horizontal, 12)
                    
                    BannerList()
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
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
