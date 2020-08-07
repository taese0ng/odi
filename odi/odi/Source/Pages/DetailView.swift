//
//  DetailView.swift
//  odi
//
//  Created by taese0ng on 2020/08/07.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct DetailTabView: View{
    @State private var Selected:Int = 1
    
    var body: some View{
        TabView(selection: $Selected) {
            Text("Tab Content 1").tabItem { Text("Tab Label 1") }.tag(1)
            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
        }
    }
}

struct DetailBtns: View{
    var body: some View{
        HStack{
            Button(action:{}){
                Text("메뉴보기")
            }
            
            Button(action:{}){
                Text("ognimemo")
            }
            
            Button(action:{}){
                Text("전화걸기")
            }
            
        }
    }
}

struct DetailView: View {
    @State private var hashTags = ["#감성", "#연인", "#데이트", "#디저트"]
    var address : String
    
    var body: some View {
        VStack{
            Image("cafeImg").resizable()
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(address: "대구광역시 중구 동덕로6길 18-13")
    }
}
