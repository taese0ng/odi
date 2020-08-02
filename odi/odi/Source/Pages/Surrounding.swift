//
//  MyLocation.swift
//  odi
//
//  Created by taese0ng on 2020/07/23.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Surrounding: View {
    var body: some View {
        NavigationView{
            VStack{
                TopBar(title:"내주변")
                Image("cafeImg").resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("이번 주 HOT 카페dd").frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
            }.frame(minWidth:0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading)
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct Surrounding_Previews: PreviewProvider {
    static var previews: some View {
        Surrounding()
    }
}
