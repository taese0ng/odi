//
//  Like.swift
//  odi
//
//  Created by taese0ng on 2020/08/04.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Like: View {
    @State private var cafeList:Array<CafeList_dispatch.cafe_info> = []
    @EnvironmentObject var store:Store
    
   var category = ["디저트", "베이커리", "브런치", "애견동반", "주택개조/한옥", "루프탑", "뷰", "포토존"]
   
   var place:String = "대구광역시 중구"
    
    var body: some View {
            VStack{
                TopBar(title:"좋아요")
                ScrollView{
                    ForEach(cafeList, id:\.self){
                        item in
                        NavigationLink(destination: DetailView(cafe_srl: item.cafe_srl).environmentObject(self.store), label:{
                            CardView(info: item, surrounding: false)
                        })
                    }
                }
            }.frame(minWidth:0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .onAppear{
            CafeList_isLike_dispatch(cafeList:self.$cafeList).isLikeList(store: store)
        }
    }
}

struct Like_Previews: PreviewProvider {
    static var previews: some View {
        Like()
    }
}
