//
//  MyPage.swift
//  odi
//
//  Created by taese0ng on 2020/07/24.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct MyPage: View {
    var screenWidth = UIScreen.main.bounds.size.width
    var screenHeight = UIScreen.main.bounds.size.height
    @ObservedObject var store = Store()
    
    var body: some View {
        NavigationView{
            VStack{
                TopBar(title:"내정보")
                Image("map")
                    .resizable()
                    .frame(width: screenWidth/2, height: screenWidth/2)
                    .cornerRadius(100)
                    .background(Color.red)
                HStack{
                    Button("로그인"){}
                    Text(" / ")
                    Button("회원가입하기 >"){}
                }
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

struct MyPage_Previews: PreviewProvider {
    static var previews: some View {
        MyPage()
    }
}
