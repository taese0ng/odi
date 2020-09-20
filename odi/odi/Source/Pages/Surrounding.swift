//
//  MyLocation.swift
//  odi
//
//  Created by taese0ng on 2020/07/23.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Surrounding: View {
    @EnvironmentObject var store:Store
    @State private var showArea = false
    var cafeList = ["대구광역시 중구 동덕로1길","대구광역시 중구 동덕로2길","대구광역시 중구 동덕로3길","대구광역시 중구 동덕로4길","대구광역시 중구 동덕로5길","대구광역시 중구 동덕로6길"]
    
    var category = ["디저트", "베이커리", "브런치", "애견동반", "주택개조/한옥", "루프탑", "뷰", "포토존"]

    var body: some View {
        NavigationView{
            VStack{
                TopBar(title:"내주변")
                ScrollView{
                    NavigationLink(destination: SelectArea(showArea:self.$showArea).environmentObject(self.store), isActive:$showArea, label: {
                        HStack{
                            Image("place")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("\(self.store.selectionArea)")
                                .foregroundColor(.black)
                        }
                    })
                   
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(category, id:\.self){
                                item in
                                Button("\(item)"){
                                    
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .foregroundColor(.black)
                            }
                        }
                    }
                    
                    ForEach(cafeList, id:\.self){
                        item in
                        NavigationLink(destination: DetailView(address: item)){
                            CardView(address: item, surrounding: true)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }.frame(minWidth:0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarColor(.white)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Surrounding_Previews: PreviewProvider {
    static var previews: some View {
        Surrounding()
    }
}
