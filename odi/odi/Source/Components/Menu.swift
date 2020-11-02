//
//  Menu.swift
//  odi
//
//  Created by taese0ng on 2020/08/27.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

//struct menu{
//    var types:String;
//    var items:Array<menuInfo>;
//}
//
//struct menuInfo{
//    var name:String;
//    var price:String;
//}

struct Menu: View {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    var menus:Array<Cafe_srl_info.Menu>
//    var menus = [menu(types:"음료", items:[menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000")]),
//                 menu(types:"음료", items:[menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000")]),
//    menu(types:"음료", items:[menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000")]),
//    menu(types:"음료", items:[menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000")]),menu(types:"음료", items:[menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000")]),menu(types:"음료", items:[menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000"),menuInfo(name:"아이스 아메리카노", price:"3000")]),]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators:false){
            VStack{
                Text("MENU")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color("Brown"))
                    
//                ForEach(self.menus, id:\.types){
//                    menu in
//                    VStack{
//                        Text(menu.types)
//                            .padding(.bottom, 10)
//                        ForEach(menu.items, id:\.name){
//                            item in
//                            HStack{
//                                Spacer()
//                                Text(item.name)
//                                Spacer()
//                                Text("\(item.price)")
//                                Spacer()
//                            }
//                        }
//                    }
//                    .padding(.top, 20)
//                }
                ForEach(self.menus, id:\.self){
                    menu in
                    HStack{
                        Spacer()
                        Text("\(menu.menu_name)")
                        Spacer()
                        Text("\(menu.menu_price)")
                        Spacer()
                    }
                }
                .padding(.top, 20)
            }
            .padding(.vertical, 20)
        }
        .frame(width:self.screenWidth-80, height: self.screenHeight-250)
        .background(Color.white)
    }
}
