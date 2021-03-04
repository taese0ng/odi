//
//  SignUpThree.swift
//  odi
//
//  Created by taese0ng on 2020/09/09.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct SignUpThree: View {
    @EnvironmentObject var store:Store
//    @State private var id:String = ""
//    @State private var pw:String = ""
    @State private var pwConfirm:String = ""
//    @State private var eMail:String = ""
//    @State private var nick:String = ""
    @State private var checked_id:Bool = false
    @State private var checked_nick:Bool = false
    @State private var checked_eMail:Bool = false
    @State private var checked_pw:Bool = false
    @State private var checked_all:Bool = false
    
    func check() -> Bool{
        var answer:Bool = false
        if(self.store.id != "" && self.checkPassword(password: self.store.pw) && checked_nick && self.store.pw == self.pwConfirm && isValidEmail(testStr: self.store.eMail)){
            answer = true
        }
        else{
            answer = false
        }
        return answer
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func checkPassword(password:String) -> Bool {
        return password.utf8.count >= 8 ? true : false
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators:false){
            VStack{
                Text("회원정보")
                .padding(.vertical, 20)
                
                VStack{
                    Text("아이디")
                        .frame(maxWidth:.infinity, alignment: .leading)
                    TextField("아이디", text: self.$store.id)
                    Divider()
                }.padding(.vertical, 20)
                
                VStack{
                    Text("비밀번호 (최소 8자 이상)")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    SecureField("비밀번호", text: self.$store.pw)
                    Divider()
                    if(!self.checkPassword(password: store.pw) && store.pw.utf8.count > 0){
                        Text("비밀번호는 최소 8자 이상입니다.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.red)
                    }
                }.padding(.vertical, 20)
                
                VStack{
                    Text("비밀번호 확인")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    SecureField("비밀번호 확인", text: self.$pwConfirm)
                    Divider()
                    if(store.pw != pwConfirm && pwConfirm.utf8.count > 0){
                        Text("비밀번호가 일치하지 않습니다.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.red)
                    }
                }.padding(.vertical, 20)
                
                VStack{
                    Text("이메일")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    TextField("이메일", text: self.$store.eMail)
                    Divider()
                    if(!self.isValidEmail(testStr: store.eMail) && store.eMail.utf8.count > 0){
                        Text("올바른 이메일 형식이 아닙니다.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.red)
                    }
                }.padding(.vertical, 20)
                
                VStack{
                    Text("닉네임")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    TextField("닉네임", text: Binding<String>(
                                get: {self.store.nick},
                                set: {
                                    self.store.nick = $0
                                    CheckUser_dispatch(checked_id: $checked_id,checked_nick:$checked_nick).dispatch_nickname(store:store)
                                }))
                    Divider()
                    if(!checked_nick && store.nick.utf8.count > 0){
                        Text("이미 존재하는 닉네임입니다.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.red)
                    } else if(checked_nick && store.nick.utf8.count > 0){
                        Text("사용가능한 닉네임입니다.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }.padding(.vertical, 20)
                
                
                Button(action:{}){
                    if(self.check()){
                        NavigationLink(destination: SignUpFour().environmentObject(self.store)){
                            Text("다음")
                                .frame(width:300, height: 50)
                                .foregroundColor(.white)
                                .background(Color("Brown"))
                                .cornerRadius(5)
                        }.disabled(checked_all)
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
