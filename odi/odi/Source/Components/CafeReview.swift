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
    var body: some View{
        HStack(spacing:10, content:{
            ForEach(0..<5){
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
                        Text("얼죽아")
                            .frame(maxWidth:.infinity, alignment: .leading)
                        Spacer()
                        if(self.myReview){
                            Text("오그니메모")
                        }
                    }
                    HStack{
                        StarRate()
                            .frame(maxWidth:.infinity, alignment: .leading)
                        Spacer()
                        if(self.myReview){
                            Text("2020년 1월 1일")
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
                Text("커피 정말 맛있어요!!!")
                    .frame(maxWidth:.infinity, alignment: .leading)
            }.padding(.leading, 50)
        }
    }
}

struct CafeReview: View {
    var myReview:Bool
    var body: some View {
        VStack{
            ForEach(0...5, id:\.self){
                item in Review(myReview:self.myReview)
            }
        }.padding(.horizontal, 20)
    }
}

//struct CafeReview_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeReview()
//    }
//}
