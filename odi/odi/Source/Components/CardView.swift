//
//  CardView.swift
//  odi
//
//  Created by taese0ng on 2020/08/04.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct CardView: View {
//    @State private var hashTags = ["#감성", "#연인", "#데이트", "#디저트"]
//    @State private var isLike:Bool = false
//    var address:String
    var info:CafeList_dispatch.cafe_info
    var screenWidth = UIScreen.main.bounds.size.width
    var surrounding:Bool
    
    var body: some View {
        VStack{
            ZStack{
                // "https://cafeodi.co.kr/api/normal/get_image?image_category_1=cafe&image_category_2=\(info.cafe_srl)&image_count=1"
                Image("cafeImg")
                    .data(url:URL(string:"https://cafeodi.co.kr/api/normal/get_image?image_category_1=cafe&image_category_2=\(info.cafe_srl)&image_count=1")!)
                    .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.none)
                
                if(surrounding){
                    
                    Text("DAY OFF")
                        .fontWeight(.bold)
                        .font(.custom("dayOff", size: 20))
                        .frame(width:80, height: 90)
                        .background(Color.black.opacity(0.6))
                        .foregroundColor(.white)
                        .position(x:60, y:45)
                        
                }
                
                Button(action:{
//                    self.isLike.toggle()
                }){
                    if(info.is_like == "Y"){
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    else{
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .font(.title)
                .foregroundColor(Color.white)
                .position(x:screenWidth-30, y:30)
            }
            
            
            HStack{
                if(info.cafe_coupon == ""){
                    Text("")
                        .font(.caption)
                        .padding(.vertical, 4.0)
                        .padding(.horizontal, 7.0)
                }
                else{
                    Text("\(info.cafe_coupon) 할인쿠폰")
                        .font(.caption)
                        .padding(.vertical, 4.0)
                        .padding(.horizontal, 7.0)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10.0)
            
                
            HStack{
                Text("\(info.cafe_name)")
                    .fontWeight(.bold)
                    .font(.custom("title", size: 20))
                    .foregroundColor(.black)
                
                Group{
                    Image("rateReview")
                        .resizable()
                        .frame(width: 15.0, height: 15.0)
                    Text("\(info.cafe_review_count ?? 0)")
                        .foregroundColor(.black)
                }
                
                Group{
                    Image(systemName: "star")
                        .resizable()
                        .frame(width:15.0, height:15.0)
                        .foregroundColor(.yellow)
                    
                    Text("\(info.cafe_review_score_avg ?? 0)")
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10.0)
            
            HStack{
                ForEach(info.cafe_tag, id:\.self){
                    tag in Text("#\(tag)")
                        .font(.custom("tag", size: 12))
                        .foregroundColor(Color("Brown"))
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10.0)
            
            Text("\(info.cafe_address)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10.0)
                .foregroundColor(.black)
        }
    }
}
