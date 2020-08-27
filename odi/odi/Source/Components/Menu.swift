//
//  Menu.swift
//  odi
//
//  Created by taese0ng on 2020/08/27.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct menu{
    var types:String;
    var items:Array<String>;
}

struct Menu: View {
    var menus = [menu(types:"음료", items:["아이스 아메리카노","아이스 아메리카노","아이스 아메리카노"]),
    menu(types:"음료", items:["아이스 아메리카노","아이스 아메리카노","아이스 아메리카노"]),
    menu(types:"음료", items:["아이스 아메리카노","아이스 아메리카노","아이스 아메리카노"]),
    menu(types:"음료", items:["아이스 아메리카노","아이스 아메리카노","아이스 아메리카노"])]
    var body: some View {
        VStack{
            Text("MENU")
            .foregroundColor(Color("Brown"))
                .font(.title)
            
            ForEach(self.menus, id:\.types){
                menu in
                VStack{
                    Text(menu.types)
                    ForEach(menu.items, id:\.self){
                        item in
                        Text(item)
                    }
                }
            }
        }.background(Color.white)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
