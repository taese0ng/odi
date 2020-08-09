//
//  DetailView.swift
//  odi
//
//  Created by taese0ng on 2020/08/07.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI
import SlidingTabView
//https://github.com/QuynhNguyen/SlidingTabView

struct DetailTabView: View{
    @State private var selectedTabIndex : Int = 0
    
    var body: some View{
        VStack{
            SlidingTabView(selection: self.$selectedTabIndex, tabs: ["카페정보", "리뷰", "스토리"], activeAccentColor: Color("Brown"),selectionBarColor: Color("Brown"))
//            ScrollView{

                if self.selectedTabIndex == 0{
                    CafeInfo()
                }
                
                else if self.selectedTabIndex == 1{
//                    CafeReview()
                }
                
                else{
                    CafeStory()
                }
//            }
            Spacer()
        }
    }
}

struct DetailBtns: View{
    var body: some View{
        HStack{
            Button(action:{}){
                Text("메뉴보기")
                .foregroundColor(Color("Brown"))
            }
            
            Button(action:{}){
                Text("ognimemo")
                .foregroundColor(Color("Brown"))
            }
            
            Button(action:{}){
                Text("전화걸기")
                .foregroundColor(Color("Brown"))
            }
            
        }
    }
}

struct CafeDetail: View {
    @State private var hashTags = ["#감성", "#연인", "#데이트", "#디저트"]
    var address : String
    
    var body: some View {
        ScrollView{
            VStack{
                Image("cafeImg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.none)
                
                HStack{
                    Text("오그니메모")
                    .font(.title)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.leading, 10.0)
                    
                    Button(action:{}){
                        Text("10% 할인쿠폰")
                            .font(.caption)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 7)
                    }
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(8)
                }
                
                HStack{
                    ForEach(hashTags, id:\.self){
                        tag in Text("\(tag)")
                            .foregroundColor(Color("Brown"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10.0)
                
                Text("\(address)")
               .frame(maxWidth: .infinity, alignment: .leading)
               .padding(.leading, 10.0)
                
                DetailBtns()
                .frame(maxWidth:.infinity, alignment: .trailing)
                
                DetailTabView()
            }
        }
    }
}

struct CafeDetail_Previews: PreviewProvider {
    static var previews: some View {
        CafeDetail(address: "대구광역시 중구 동덕로6길 18-13")
    }
}
