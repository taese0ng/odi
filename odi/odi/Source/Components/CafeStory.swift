//
//  CafeStory.swift
//  odi
//
//  Created by taese0ng on 2020/08/08.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct CafeStory: View {
    var screenWidth = UIScreen.main.bounds.size.width
    var body: some View {
        VStack{
            List(0...2, id: \.self){
                item in
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
    }
}

struct CafeStory_Previews: PreviewProvider {
    static var previews: some View {
        CafeStory()
    }
}
