//
//  MyRecentCafe.swift
//  odi
//
//  Created by taese0ng on 2020/08/18.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct MyRecentCafe: View {
//    var cafeList = ["대구광역시 중구 동덕로1길","대구광역시 중구 동덕로2길","대구광역시 중구 동덕로3길","대구광역시 중구 동덕로4길","대구광역시 중구 동덕로5길","대구광역시 중구 동덕로6길"]
    @State private var cafeList:Array<CafeList_dispatch.cafe_info> = []
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators:false){
                ForEach(cafeList, id:\.self){
                    item in
                    NavigationLink(destination: DetailView(cafe_srl: item.cafe_srl), label:{
                        CardView(info: item, surrounding: false)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }.frame(minWidth:0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: .top)
        .navigationBarTitle(Text("최근 본 카페"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

struct MyRecentCafe_Previews: PreviewProvider {
    static var previews: some View {
        MyRecentCafe()
    }
}
