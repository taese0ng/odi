//
//  Login.swift
//  odi
//
//  Created by taese0ng on 2020/08/13.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Login: View {
    @State private var ID:String = ""
    @State private var PW:String = ""
    @EnvironmentObject var store:Store
    @State private var showingAlert:Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            TextField("아이디", text: self.$ID)
                .padding(.horizontal, 50)
            Divider()
                .padding(.horizontal, 50)
                .padding(.bottom, 5)
            
            SecureField("비밀번호 (최소 8자 이상)", text: self.$PW)
                .padding(.horizontal, 50)
            Divider()
                .padding(.horizontal, 50)
            
            HStack{
                Button(action:{
                    Login_dispatch(showingAlert:$showingAlert).dispatch(store:store, id:self.ID, pw:self.PW)
                }){
                    Text("로그인")
                        .foregroundColor(Color("LightGray"))
                        .font(.custom("login", size: 23))
                        .frame(width:150)
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("로그인"),
                          message: Text("로그인에 실패하였습니다."),
                          dismissButton: .default(Text("ok"))
                    )
                }
                
                NavigationLink(destination: SignUpOne().environmentObject(self.store),
                               isActive: $store.MyPage_root, label:{
                    Text("회원가입")
                        .foregroundColor(Color("LightGray"))
                        .font(.custom("signUp", size: 23))
                        .frame(width: 150)
                })
            }.padding(.top, 70)
            
            
            Spacer()
            Button(action:{}){
                Text("비밀번호를 잊으셨나요?")
                .foregroundColor(Color("Brown"))
                    .padding(.bottom, 30)
            }
            
        }.navigationBarTitle(Text("로그인"), displayMode: .inline)
        .frame(minWidth:0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
