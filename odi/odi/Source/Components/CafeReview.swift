//
//  CafeReview.swift
//  odi
//
//  Created by taese0ng on 2020/08/08.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct StarRate : View{
    @State private var selected = -1
    var rate:Int
    
    var body: some View{
        HStack(spacing:10, content:{
            ForEach(0..<rate){
                i in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width:15, height: 15)
                    .foregroundColor(self.selected >= i ? .yellow : .gray)
                    .onTapGesture {
                        self.selected = i
                }
            }
        })
    }
}
struct Review : View{
    var myReview:Bool
    var data: myReview_dispatch.cafe_review_interface
    
    var body : some View{
        VStack{
            HStack{
                Image("place")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .background(Color.red)
                    .cornerRadius(100)
                VStack{
                    HStack{
                        Text("\(data.user_nick_name)")
                            .frame(maxWidth:.infinity, alignment: .leading)
                        Spacer()
                        if(self.myReview){
                            Text("오그니메모")
                        }
                    }
                    HStack{
                        StarRate(rate:data.review_score)
                            .frame(maxWidth:.infinity, alignment: .leading)
                        Spacer()
                        if(self.myReview){
                            Text("\(data.review_reg_date)")
                        }
                    }
                }
            }
            
            VStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0...5, id:\.self){
                            img in
                            Image("cafeImg")
                            .resizable()
                                .frame(width:60, height: 50)
                        }
                    }
                }
                Text("\(data.review_content)")
                    .frame(maxWidth:.infinity, alignment: .leading)
            }.padding(.leading, 50)
        }
    }
}

struct CafeReview: View {
    @EnvironmentObject var store:Store
    var myReview:Bool
    var srl:Int
//    @State private var reviewList:Array<CafeReview_dispatch.cafe_reviews_interface> = []
    @State private var reviewList:Array<myReview_dispatch.cafe_review_interface>=[]
    var body: some View {
        VStack{
            ForEach(reviewList, id:\.self){
                item in Review(myReview: true, data: item)
            }
        }.padding(.horizontal, 20)
        .onAppear{
            CafeReview_dispatch(reviewList:$reviewList).search_dispatch(store: store, srl: srl)
        }
    }
}

//struct CafeReview_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeReview()
//    }
//}
