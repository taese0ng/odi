//
//  MyLocation.swift
//  odi
//
//  Created by taese0ng on 2020/07/23.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI
import SwiftyJSON

struct Surrounding: View {
    @EnvironmentObject var store:Store
    
//    var cafeList = ["대구광역시 중구 동덕로1길","대구광역시 중구 동덕로2길","대구광역시 중구 동덕로3길","대구광역시 중구 동덕로4길","대구광역시 중구 동덕로5길","대구광역시 중구 동덕로6길"]
    
    var category = ["디저트", "베이커리", "브런치", "애견동반", "주택개조/한옥", "루프탑", "뷰", "포토존"]
    @State private var selectCategory:String = "firstSelect"
    @State private var cafeList:Array<CafeList_dispatch.cafe_info> = []
    
    var body: some View {
            VStack{
                TopBar(title:"내주변")
                
                HStack{
                    Image("place")
                        .resizable()
                        .frame(width: 10, height: 10)
                    Text("\(self.store.selectionArea)")
                        .fontWeight(.bold)
                        .font(.custom("area", size: 15))
                        .foregroundColor(.black)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(category, id:\.self){
                            item in
                            Button(action:{
                                self.selectCategory=item
                                CafeList_dispatch(cafeList:self.$cafeList).search_dispatch(store:self.store, search_type: "category", search_value: item)
                            }){
                                if(item == self.selectCategory){
                                    Text("\(item)")
                                        .font(.custom("item", size: 15))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 10)
                                        .foregroundColor(Color("Brown"))
                                } else {
                                    Text("\(item)")
                                        .font(.custom("item", size: 15))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 10)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
                ScrollView(.vertical, showsIndicators:false){
                    ForEach(cafeList, id:\.self){
                        item in
                        NavigationLink(destination: DetailView(cafe_srl: item.cafe_srl).environmentObject(self.store), label:{
                            CardView(info: item, surrounding: true)
                        })
                    }
                }
            }.frame(minWidth:0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading)
        .onAppear(){
            // 첫 로딩시 실행되는데 무조건 로그인 후에 받아와야해서 로그인전에 못불러옴.
            // 로그인 후 한번 더 탭을 활성화시켜줘야함. -> 로그인안해도 내주변에있는건 불러와야하지않나..?
            if(self.selectCategory == "firstSelect"){
                CafeList_dispatch(cafeList:self.$cafeList).search_dispatch(store:self.store, search_type: "category", search_value: "디저트")
            }
        }
    }
}

struct Surrounding_Previews: PreviewProvider {
    static var previews: some View {
        Surrounding()
    }
}
