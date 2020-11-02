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
                            .padding(.bottom, 5)
                            
                            Text("\(item)")
                            .font(.caption)
                            .foregroundColor(Color.black)
                        }
                    }
                    .frame(width:self.screenWidth/5, height:80)
                    .padding(5)
                    .padding(.vertical, 10)
                }
            }
            .padding(.horizontal, 10)
            
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
                            .padding(.bottom, 5)
                            
                            Text("\(item)")
                            .font(.caption)
                            .foregroundColor(Color.black)
                        }
                    }
                    .frame(width:self.screenWidth/5, height:80)
                    .padding(5)
                    .padding(.vertical, 10)
                }
            }.padding(.horizontal, 10)
        }
    }
}

struct HotCafe:View{
    @EnvironmentObject var store:Store
    var screenWidth = UIScreen.main.bounds.size.width
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach((1...5).reversed(), id:\.self){item in
                    //cafe_srl 임시로 30 준거임. 제대로 받아와서 줘야함.
                    NavigationLink(destination: DetailView(cafe_srl: 30).environmentObject(self.store), label:{
                        CafeCard(cafeName: String(item))
                    })
                }
            }.padding(.horizontal,10)
        }
    }
}

struct RecentCafe:View{
    @EnvironmentObject var store:Store
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach((1...5).reversed(), id:\.self){item in
                    //cafe_srl 임시로 30 준거임. 제대로 받아와서 줘야함.
                    NavigationLink(destination: DetailView(cafe_srl: 30).environmentObject(self.store), label:{
                        CafeCard(cafeName: String(item))
                    })
                }
            }.padding(.horizontal,10)
        }
    }
}

struct BannerList: View{
    @EnvironmentObject var store:Store
    var body: some View{
        ScrollView(.vertical, showsIndicators:false){
            ForEach((1...5), id:\.self){
                item in
                //cafe_srl 임시로 30 준거임. 제대로 받아와서 줘야함.
                NavigationLink(destination: DetailView(cafe_srl: 30).environmentObject(self.store), label:{
                    CafeBanner()
                        .padding(.bottom, 10)
                })
                
            }
        }.padding(.horizontal, 10)
    }
}

struct Home: View{
    @Binding var Selection:Int
    @EnvironmentObject var store:Store
    
    var body: some View{
        NavigationView{
            VStack{
                TopBar(title:"오디")
                ScrollView{
                    //자동 가로 배너
                    GeometryReader { geometry in
                        Carousel(numberOfImages: 3) {
                            Image("cafeImg")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 150)
                                .clipped()
                            Image("rateReview")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 150)
                                .clipped()
                            Image("cafeImg")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 150)
                                .clipped()
                        }
                    }.frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
                    
                    MenuBtns(Selection : $Selection)
                    
                    Text("이번 주 HOT 카페")
                        .fontWeight(.bold)
                        .font(.custom("hot", size: 20))
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    // HotCafe 어떻게 얻어와야할까요
                    HotCafe()
                        .environmentObject(self.store)
                        .padding(.horizontal, 10)

                    Text("최근 본 카페")
                        .fontWeight(.bold)
                        .font(.custom("hot", size: 20))
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // 쿠키를 이용해서 받아오면된다고함.
                    RecentCafe()
                        .environmentObject(self.store)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 15)
                    
                    // 이놈도 받아올 방법이없음.
                    BannerList()
                        .environmentObject(self.store)
                        .padding(.horizontal, 10)
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
