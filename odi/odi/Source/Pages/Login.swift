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
    
    var body: some View {
        VStack{
            TextField("아이디", text: self.$ID)
                .padding(.horizontal, 50)
            Divider()
                .padding(.horizontal, 50)
            SecureField("비밀번호 (최소 8자 이상)", text: self.$PW)
                .padding(.horizontal, 50)
            Divider()
            .padding(.horizontal, 50)
            
            HStack{
                Button(action:{}){
                    Text("로그인")
                }
                
                Button(action: {}){
                    Text("회원가입")
                }
            }
            
            Button(action:{}){
                Text("비밀번호를 잊으셨나요?")
                .foregroundColor(Color("Brown"))
            }
        }.navigationBarTitle(Text("로그인"), displayMode: .inline)
        .frame(minWidth:0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: .topLeading)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
