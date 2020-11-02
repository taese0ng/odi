//
//  CafeInfo.swift
//  odi
//
//  Created by taese0ng on 2020/08/08.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct CafeInfo: View {
    var info:Cafe_srl_info
    var body: some View {
        VStack{
            Group{
                Text("기본정보")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("영업일 화 수 목 금 토 일")
                    .padding(.vertical, 5)
                HStack{
                    Text("OPEN")
                        .fontWeight(.bold)
                    Text("11:00 AM")
                }.padding(.vertical, 5)
                
                HStack{
                    Text("CLOSE")
                        .fontWeight(.bold)
                    Text("7:00 PM")
                }.padding(.vertical, 5)
                
                HStack{
                    Text("CALL")
                        .fontWeight(.bold)
                    Text("\(info.cafe_phone ?? "번호가 없습니다.")")
                }.padding(.vertical, 5)
            }
            
            Group{
                Text("편의정보")
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    HStack{
                        Image(systemName: "wifi")
                        Text("와이파이")
                    }
                    .frame(width:90, alignment: .leading)
                    .padding(.horizontal,8)
                    
                    HStack{
                        Image("parking")
                        Text("주차기능")
                    }
                    .frame(width:90, alignment: .leading)
                    .padding(.horizontal,8)
                    
                    HStack{
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text("노키즈존")
                    }
                    .frame(width:90, alignment: .leading)
                    .padding(.horizontal,8)
                }.padding(.vertical, 5)
                
                HStack{
                    HStack{
                        Image(systemName: "phone.fill")
                        Text("예약가능")
                    }.frame(width:90, alignment: .leading)
                    .padding(.horizontal,8)
                    
                    HStack{
                        Image(systemName: "person.2.fill")
                        Text("단체가능")
                    }
                    .frame(width:90, alignment: .leading)
                    .padding(.horizontal,8)
                    
                    HStack{
                        Image("pets")
                        Text("애견동반")
                    }
                    .frame(width:90, alignment: .leading)
                    .padding(.horizontal,8)
                }.padding(.vertical, 5)
            }
            
            Group{
                Text("카페안내")
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(info.cafe_info)")
                    .padding(.vertical, 5)
            }
            
            Group{
                Text("위치안내")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
            }
        }
    }
}
