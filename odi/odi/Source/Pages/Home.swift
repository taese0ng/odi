//
//  Home.swift
//  odi
//
//  Created by taese0ng on 2020/07/23.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct MenuBtns: View{
    var body: some View{
        VStack{
            HStack{
                Button("Button"){}
                .frame(width:80, height:80)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                Button("Button"){}
                .frame(width:80, height:80)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                .frame(width:80, height:80)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                .frame(width:80, height:80)
                .background(Color.blue)
                .foregroundColor(Color.white)
            }
            
            HStack{
                Button("Button"){}
                    .frame(width:80, height:80)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                .frame(width:80, height:80)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                .frame(width:80, height:80)
                .background(Color.blue)
                .foregroundColor(Color.white)
                Button("Button"){}
                .frame(width:80, height:80)
                .background(Color.blue)
                .foregroundColor(Color.white)
            }
        }
    }
}

struct Home: View{
    var body: some View{
        VStack{
            HStack{
                Text("ODI").frame(maxWidth: .infinity, alignment: .leading).font(.title)
            }
            Image("cafeImg").resizable()
                .aspectRatio(contentMode: .fit)
            Button("Button"){
                print("Button1")
            }
            MenuBtns()
            Text("이번 주 HOT 카페").frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
        }.frame(minWidth:0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
