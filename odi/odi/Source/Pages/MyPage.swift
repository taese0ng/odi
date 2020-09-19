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
    @EnvironmentObject var store:Store
    
    var body: some View {
        NavigationView{
            VStack{
                TopBar(title:"내정보")
                Image("map")
                    .resizable()
                    .frame(width: screenWidth/2, height: screenWidth/2)
                    .background(Color.red)
                    .cornerRadius(100.0)
                
                if(self.store.isLogin){
                    VStack{
                        Text("\(self.store.nick)")
                            .foregroundColor(.black)
                            .font(.custom("nick", size: 26))
                            .padding(.bottom, 5)
                        
                        NavigationLink(
                            destination: MyInfoModify().environmentObject(self.store),
                            label: {
                                Text("내 정보 수정 > ")
                                    .foregroundColor(Color("LightGray"))
                                    .font(.custom("login", size: 18))
                            })
                    }
                }
                
                else{
                    HStack{
                        Button(action:{}){
                            NavigationLink(destination: Login().environmentObject(self.store)){
                                Text("로그인")
                            }
                        }
                        .foregroundColor(.black)
                        
                        Text(" / ")
                        
                        Button(action:{}){
                            NavigationLink(destination: SignUpOne().environmentObject(self.store)){
                                Text("회원가입하기 >")
                            }
                        }
                        .foregroundColor(.black)
                    }.padding(30)
                }
                Button(action:{}){
                    NavigationLink(destination: MyReview()){
                        Text("내가 작성한 리뷰")
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .padding(.vertical, 10)
                        .foregroundColor(.black)
                    }
                }
                
                Button(action:{}){
                    NavigationLink(destination: MyRecentCafe()){
                        Text("최근 본 카페")
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .padding(.vertical, 10)
                        .foregroundColor(.black)
                    }
                }
                
                Button(action:{}){
                    NavigationLink(destination: MoreDetails()){
                        Text("더보기")
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .padding(.vertical, 10)
                        .foregroundColor(.black)
                    }
                }
            }.frame(minWidth:0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarColor(.white)
            .padding(.horizontal, 30)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MyPage_Previews: PreviewProvider {
    static var previews: some View {
        MyPage()
    }
}
