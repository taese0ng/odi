//
//  CafeInfo.swift
//  odi
//
//  Created by taese0ng on 2020/08/08.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct CafeInfo: View {
    var body: some View {
        VStack{
            Group{
                Text("기본정보")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("영업일 화 수 목 금 토 일")
                HStack{
                    Text("OPEN")
                        .fontWeight(.bold)
                    Text("11:00 AM")
                }
                HStack{
                    Text("CLOSE")
                        .fontWeight(.bold)
                    Text("7:00 PM")
                }
                HStack{
                    Text("CALL")
                        .fontWeight(.bold)
                    Text("010-1234-1234")
                }
            }
            
            Group{
                Text("편의정보")
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Text("와이파이")
                    Text("주차기능")
                    Text("노키즈존")
                }
                HStack{
                    Text("예약가능")
                    Text("단체가능")
                    Text("애견동반")
                }
            }
            
            Group{
                Text("카페안내")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("달달한 디저트 맛집 오그니메모! 많이 찾아주세요!")
            }
            
            Group{
                Text("위치안내")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct CafeInfo_Previews: PreviewProvider {
    static var previews: some View {
        CafeInfo()
    }
}
