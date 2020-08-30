//
//  Coupon.swift
//  odi
//
//  Created by taese0ng on 2020/08/30.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Coupon: View {
    var body: some View {
        VStack{
            Text("COUPON")
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color("Brown"))
                .foregroundColor(.white)
                
            VStack{
                Text("10% 할인쿠폰")
                    .frame(maxWidth:.infinity)
                    .font(.title)
                
                Text("* 1만원이상 주문시 사용가능합니다.")
                    .frame(maxWidth:.infinity)
                    .foregroundColor(Color("LightGray"))
            }
            .padding(.vertical, 50)
            
            Button(action:{}){
                Text("사용하기")
                .padding()
                    .frame(maxWidth:.infinity)
                    .foregroundColor(Color("Brown"))
            }
        }
        .frame(maxWidth: 300)
        .background(Color.white)
    }
}

struct Coupon_Previews: PreviewProvider {
    static var previews: some View {
        Coupon()
    }
}
