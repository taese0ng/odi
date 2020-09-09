//
//  MoreDetails.swift
//  odi
//
//  Created by taese0ng on 2020/09/10.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct MoreDetails: View {
    var body: some View {
        VStack{
            HStack{
                Image("notification")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width:40, height: 40)
                    .foregroundColor(Color("Brown"))
                Text("공지사항")
                Spacer()
            }.padding(.vertical, 10)
            Divider()
                .background(Color("Brown"))
            
            HStack{
                Image("help")
                .renderingMode(.template)
                .resizable()
                .frame(width:40, height: 40)
                .foregroundColor(Color("Brown"))
                Text("카카오톡 1:1 문의")
                Spacer()
            }.padding(.vertical, 10)
            Divider()
            .background(Color("Brown"))
            
            HStack{
                Image("error")
                .renderingMode(.template)
                .resizable()
                .frame(width:40, height: 40)
                .foregroundColor(Color("Brown"))
                Text("오디 정보")
                Spacer()
            }.padding(.vertical, 10)

            Spacer()
        }.padding(.horizontal,30)
    }
}

struct MoreDetails_Previews: PreviewProvider {
    static var previews: some View {
        MoreDetails()
    }
}
