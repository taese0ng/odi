//
//  CardView.swift
//  odi
//
//  Created by taese0ng on 2020/08/04.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @State private var hashTags = ["#감성", "#연인", "#데이트", "#디저트"]
    @State private var isLike:Color = Color.white
    var address:String
    var screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack{
            ZStack{
                Image("cafeImg").resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.none)
                
                Text("DAY OFF")
                    .frame(width:100, height: 100)
                    .font(.title)
                    .background(Color.white)
                    .position(x:60, y:60)
                
                Button(action:{
                    if (self.isLike == Color.red){
                        self.isLike = Color.white
                    }else{
                        self.isLike = Color.red
                    }
                }){
                    Image(systemName: "heart")
                }
                .font(.title)
                .foregroundColor(self.isLike)
                .position(x:screenWidth-30, y:30)
            }
            
            HStack{
                Button(action:{}){
                    Text("10% 할인쿠폰")
                        .font(.caption)
                        .padding(.vertical, 4.0)
                        .padding(.horizontal, 7.0)
                }
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10.0)
            
            HStack{
                Text("오그니메모")
                    .font(.title)
                
                Group{
                    Image("rateReview")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Text("3")
                }
                
                Group{
                    Image(systemName: "star")
                        .resizable()
                        .frame(width:20.0, height:20.0)
                        .foregroundColor(.yellow)
                    
                    Text("4.5")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10.0)
            
            HStack{
                ForEach(hashTags, id:\.self){
                    tag in Text("\(tag)")
                        .foregroundColor(.yellow)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10.0)
            
            Text("\(address)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10.0)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(address:"대구광역시 중구 동덕로6길")
    }
}
