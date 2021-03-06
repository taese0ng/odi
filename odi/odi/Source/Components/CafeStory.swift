//
//  CafeStory.swift
//  odi
//
//  Created by taese0ng on 2020/08/08.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Story:View{
    var screenWidth = UIScreen.main.bounds.size.width
    var body:some View{
        VStack{
            HStack{
                Image("place")
                VStack{
                    Text("얼죽아")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("2020년 1월 1일")
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            Image("cafeImg")
            .resizable()
            .frame(width:self.screenWidth, height: 300)
        }
    }
}

struct CafeStory: View {
    var body: some View {
        VStack{
            ForEach(0...5, id: \.self){
                item in Story()
            }
        }
    }
}

//struct CafeStory_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeStory()
//    }
//}
