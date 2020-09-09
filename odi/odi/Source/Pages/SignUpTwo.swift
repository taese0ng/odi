//
//  SignUpTwo.swift
//  odi
//
//  Created by taese0ng on 2020/09/09.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct SignUpTwo: View {
    @State private var id:String = ""
    @State private var pw:String = ""
    @State private var pwConfirm:String = ""
    @State private var eMail:String = ""
    @State private var nick:String = ""
    
    var body: some View {
        VStack{
            Text("회원정보")
            .padding(.vertical, 20)
            
            VStack{
                Text("아이디")
                    .frame(maxWidth:.infinity, alignment: .leading)
                TextField("아이디", text: self.$id)
                Divider()
            }.padding(.vertical, 20)
            
            VStack{
                Text("비밀번호 (최소 8자 이상)")
                .frame(maxWidth:.infinity, alignment: .leading)
                SecureField("비밀번호", text: self.$pw)
                Divider()
            }.padding(.vertical, 20)
            
            VStack{
                Text("비밀번호 확인")
                .frame(maxWidth:.infinity, alignment: .leading)
                SecureField("비밀번호 확인", text: self.$pwConfirm)
                Divider()
            }.padding(.vertical, 20)
            
            VStack{
                Text("이메일")
                .frame(maxWidth:.infinity, alignment: .leading)
                TextField("이메일", text: self.$eMail)
                Divider()
            }.padding(.vertical, 20)
            
            VStack{
                Text("닉네임")
                .frame(maxWidth:.infinity, alignment: .leading)
                TextField("닉네임", text: self.$nick)
                Divider()
            }.padding(.vertical, 20)
            
            Button(action:{}){
                Text("다음")
                    .frame(width:300, height: 50)
                    .foregroundColor(.white)
                    .background(Color("Brown"))
                    .cornerRadius(5)
            }
        }
        .padding(.horizontal, 30)
    }
}

struct SignUpTwo_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTwo()
    }
}
