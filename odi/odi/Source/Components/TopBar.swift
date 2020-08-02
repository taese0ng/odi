//
//  TopBar.swift
//  odi
//
//  Created by taese0ng on 2020/07/24.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Search: View {
    @State private var SearchValue:String = ""
    var popularBtnList = ["디저트", "감성카페", "애견카페", "노키즈존"]
    var screenWidth = UIScreen.main.bounds.size.width
    var body: some View{
        VStack{
            HStack{
                Image(systemName:"magnifyingglass").padding(.trailing).font(.title)
                VStack{
                    TextField("카페명 또는 태그를 입력하세요.", text: $SearchValue)
                        .font(.custom("custom", size: 20))
                    Divider()
                }.frame(width:screenWidth-100)
            }.padding([.horizontal, .bottom])
            
            Text("인기")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 7.0)
            HStack{
                ForEach(popularBtnList, id:\.self){
                    item in
                    Button(item){}
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.all, 6.0)
                        .background(Color("LightGray"))
                    .cornerRadius(10)
                }
            }
            .frame(maxWidth:.infinity,
                   alignment: .leading)
                .padding([.leading, .bottom])
            
            Text("최근")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.horizontal, .top])
                .padding(.bottom, 7.0)
        }.navigationBarTitle(Text("카페찾기"), displayMode: .inline)
        .frame(minWidth:0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: .topLeading)
    }
}

struct LeadingNaviView: View{
    var title: String
    var body: some View{
        Text(title)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .font(.title)
        .foregroundColor(.black)
    }
}

struct TrailingNaviView: View{
    var body: some View{
        NavigationLink(destination: Search()){
            Image(systemName:"magnifyingglass")
            .font(.title)
            .foregroundColor(.black)
        }
    }
}

struct TopBar: View {
    var title:String
    var body: some View {
        Text("")
            .navigationBarItems(leading:
                LeadingNaviView(title: title)
            , trailing:
                TrailingNaviView()
        )
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            TopBar(title:"내주변")
            Search()
        }
    }
}
