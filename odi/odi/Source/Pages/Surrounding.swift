//
//  MyLocation.swift
//  odi
//
//  Created by taese0ng on 2020/07/23.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Surrounding: View {
    @ObservedObject var store = Store()
    var body: some View {
        NavigationView{
            VStack{
                TopBar(title:"내주변")
                Image("cafeImg").resizable()
                    .aspectRatio(contentMode: .fit)
                Button("Button"){
                    print("Button1")
                }
                
                Text("이번 주 HOT 카페dd").frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
            }.frame(minWidth:0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading)
            .navigationBarTitle("")
            .navigationBarHidden(self.store.isNavigationBarHidden)
            .onAppear(){
                self.store.isNavigationBarHidden=true
            }
            .onDisappear(){
                self.store.isNavigationBarHidden=false
            }
        }
    }
}

struct Surrounding_Previews: PreviewProvider {
    static var previews: some View {
        Surrounding()
    }
}
