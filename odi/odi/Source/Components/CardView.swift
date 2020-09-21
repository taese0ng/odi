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
    @State private var isLike:Bool = false
    var address:String
    var screenWidth = UIScreen.main.bounds.size.width
    var surrounding:Bool
    
    var body: some View {
        VStack{
            ZStack{
                Image("cafeImg").resizable()
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
                    self.isLike.toggle()
                }){
                    if(self.isLike){
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
                Button(action:{}){
                    Text("10% 할인쿠폰")
                        .font(.caption)
                        .padding(.vertical, 4.0)
                        .padding(.horizontal, 7.0)
                }
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10.0)
            
            HStack{
                Text("오그니메모")
                    .fontWeight(.bold)
                    .font(.custom("title", size: 20))
                
                Group{
                    Image("rateReview")
                        .resizable()
                        .frame(width: 15.0, height: 15.0)
                    Text("3")
                }
                
                Group{
                    Image(systemName: "star")
                        .resizable()
                        .frame(width:15.0, height:15.0)
                        .foregroundColor(.yellow)
                    
                    Text("4.5")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10.0)
            
            HStack{
                ForEach(hashTags, id:\.self){
                    tag in Text("\(tag)")
                        .font(.custom("tag", size: 10))
                        .foregroundColor(Color("Brown"))
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
        CardView(address:"대구광역시 중구 동덕로6길", surrounding: true)
    }
}
