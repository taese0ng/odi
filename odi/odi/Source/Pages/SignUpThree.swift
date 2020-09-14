//
//  SignUpThree.swift
//  odi
//
//  Created by taese0ng on 2020/09/09.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct SignUpThree: View {
    @EnvironmentObject var info:SignUpInfo
//    @State private var id:String = ""
//    @State private var pw:String = ""
    @State private var pwConfirm:String = ""
//    @State private var eMail:String = ""
//    @State private var nick:String = ""
    
    func check() -> Bool{
        var answer:Bool = false
        if(self.info.id != "" && self.info.pw != "" && self.pwConfirm == self.info.pw && self.info.eMail != "" && self.info.nick != ""){
            answer = true
        }
        else{
            answer = false
        }
        return answer
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("회원정보\(self.info.name)")
                .padding(.vertical, 20)
                
                VStack{
                    Text("아이디")
                        .frame(maxWidth:.infinity, alignment: .leading)
                    TextField("아이디", text: self.$info.id)
                    Divider()
                }.padding(.vertical, 20)
                
                VStack{
                    Text("비밀번호 (최소 8자 이상)")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    SecureField("비밀번호", text: self.$info.pw)
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
                    TextField("이메일", text: self.$info.eMail)
                    Divider()
                }.padding(.vertical, 20)
                
                VStack{
                    Text("닉네임")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    TextField("닉네임", text: self.$info.nick)
                    Divider()
                }.padding(.vertical, 20)
                
                
                Button(action:{}){
                    if(self.check()){
                        NavigationLink(destination: SignUpFour().environmentObject(self.info)){
                            Text("다음")
                                .frame(width:300, height: 50)
                                .foregroundColor(.white)
                                .background(Color("Brown"))
                                .cornerRadius(5)
                        }
                    }
                    else{
                        Text("다음")
                        .frame(width:300, height: 50)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(5)
                    }
                }
            }
            .padding(.bottom, 40)
        }
        .frame(maxHeight:.infinity, alignment: .top)
        .padding(.horizontal, 30)
        .navigationBarTitle(Text("회원가입 3/4"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

struct SignUpThree_Previews: PreviewProvider {
    static var previews: some View {
        SignUpThree()
    }
}
