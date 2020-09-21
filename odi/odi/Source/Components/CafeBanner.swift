//
//  CafeBanner.swift
//  odi
//
//  Created by taese0ng on 2020/08/21.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct CafeBanner: View {
    var screenWidth = UIScreen.main.bounds.size.width
    var body: some View {
        ZStack{
            Image("cafeImg")
                .frame(maxWidth: self.screenWidth-40, maxHeight: 200)
            VStack{
                Spacer()
                Text("배너1")
                    .padding(15)
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .topLeading)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.5))
            }
        }
        .cornerRadius(20)
        .frame(maxWidth: self.screenWidth-40, maxHeight: 200)
    }
}

struct CafeBanner_Previews: PreviewProvider {
    static var previews: some View {
        CafeBanner()
    }
}
