//
//  MyInfoModify.swift
//  odi
//
//  Created by taese0ng on 2020/09/19.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct PasswordConfirm: View {
    @State private var password:String=""
    @EnvironmentObject var store:Store
    @Binding var isOK:Bool
    
    var body: some View {
        VStack{
            Spacer()
            SecureField("비밀번호를 입력하세요.", text:self.$password)
            Divider()
                .padding(.bottom, 20)
            if(self.store.pw == self.password){
                Button(action:{self.isOK = true}){
                    Text("확인")
                        .frame(maxWidth:.infinity, maxHeight: 50)
                        .background(Color("Brown"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            else{
                Text("확인")
                    .frame(maxWidth:.infinity, maxHeight: 50)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            Spacer()
            Spacer()
        }
    }
}

struct Info:View{
    @EnvironmentObject var store:Store
    @State private var eMailModify:Bool=false
    @State private var callModify:Bool=false
    @State private var passModify:Bool=false
    @State private var eMail:String=""
    @State private var callNum:String=""
    @State private var callNumConfirm:String=""
    @State private var nowPW:String=""
    @State private var newPW:String=""
    @State private var newPWConfirm:String=""
    @State private var showingAlert:Bool=false
    @State private var alertMsg:String=""
    
    func gender_check()->String{
        if(store.sex == "M"){
            return "남"
        }
        else{
            return "여"
        }
    }
    
    var body:some View{
        VStack{
            VStack{
                HStack{
                    Text("내 정보")
                    Spacer()
                }
                Spacer()
            }
            
            VStack{
                HStack{
                    Text("아이디")
                        .frame(width:70, alignment: .leading)
                    Text("\(self.store.id)")
                    Spacer()
                }
                Spacer()
            }
            
            VStack{
                HStack{
                    Text("이름")
                        .frame(width:70, alignment: .leading)
                    Text("\(self.store.name)")
                    Spacer()
                }
                Spacer()
            }
            
            VStack{
                HStack{
                    Text("성별")
                        .frame(width:70, alignment: .leading)
                    Text("\(self.gender_check())")
                    Spacer()
                }
                Spacer()
            }
            
            VStack{
                HStack{
                    Text("생년월일")
                        .frame(width:70, alignment: .leading)
                    Text("\(self.store.birth)")
                    Spacer()
                }
                Spacer()
            }
            
            VStack{
                HStack{
                    Text("이메일")
                        .frame(width:70, alignment: .leading)
                    Text("\(self.store.eMail)")
                    Spacer()
                    Button(action:{
                        self.eMailModify.toggle()
                        self.eMail=""
                    }){
                        Text("수정하기")
                            .foregroundColor(Color("Brown"))
                    }
                }
                if(self.eMailModify){
                    HStack{
                        VStack{
                            TextField("이메일 입력", text:self.$eMail)
                            Divider()
                        }
                        if(self.eMail != ""){
                            Button(action:{
                                self.store.eMail = self.eMail
                                self.eMailModify.toggle()
                                self.eMail = ""
                            }){
                                Text("저장")
                                    .frame(width: 50, height: 25)
                                    .background(Color("Brown"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                        else{
                            Text("저장")
                                .frame(width: 50, height: 25)
                                .background(Color("LightGray"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                }
            }
            Spacer()
            
            VStack{
                HStack{
                    Text("전화번호")
                        .frame(width:70, alignment: .leading)
                    Text("\(self.store.callNum)")
                    Spacer()
                    Button(action:{
                        self.callModify.toggle()
                        self.callNum=""
                        self.callNumConfirm=""
                    }){
                        Text("수정하기")
                            .foregroundColor(Color("Brown"))
                    }
                }
                
                if(self.callModify){
                    HStack{
                        VStack{
                            TextField("휴대폰 번호 입력", text:self.$callNum)
                            Divider()
                        }
                        if(self.callNum != ""){
                            Button(action:{}){
                                Text("전송")
                                    .frame(width: 50, height: 25)
                                    .background(Color("Brown"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                        else{
                            Text("전송")
                                .frame(width: 50, height: 25)
                                .background(Color("LightGray"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                    
                    HStack{
                        VStack{
                            TextField("인증번호", text:self.$callNumConfirm)
                            Divider()
                        }
                        if(self.callNumConfirm != ""){
                            Button(action:{
                                if(self.callNumConfirm == "123"){
                                    self.store.callNum = self.callNum
                                    self.callModify.toggle()
                                    self.callNum = ""
                                    self.callNumConfirm=""
                                }
                            }){
                                Text("저장")
                                    .frame(width: 50, height: 25)
                                    .background(Color("Brown"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                        else{
                            Text("저장")
                                .frame(width: 50, height: 25)
                                .background(Color("LightGray"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                }
            }
            Spacer()
            
            VStack{
                HStack{
                    Text("비밀번호")
                        .frame(width:70, alignment: .leading)
                    Text("*********")
                    Spacer()
                    Button(action:{
                        self.passModify.toggle()
                        self.nowPW=""
                        self.newPW=""
                        self.newPWConfirm=""
                    }){
                        Text("수정하기")
                            .foregroundColor(Color("Brown"))
                    }
                }
                if(self.passModify){
                    VStack{
                        SecureField("현재 비밀번호 입력", text:self.$nowPW)
                        Divider()
                    }
                    VStack{
                        SecureField("새 비밀번호 입력 (최소 8자)", text:self.$newPW)
                        Divider()
                    }
                    HStack{
                        VStack{
                            SecureField("새 비밀번호 확인", text:self.$newPWConfirm)
                            Divider()
                        }
                        if(self.newPW != "" && self.newPW == self.newPWConfirm){
                            Button(action:{
                                if(self.nowPW == self.store.pw){
                                    ChangePassword_dispatch(showingAlert: $showingAlert, alertMsg: $alertMsg).dispatch(store:self.store, pw:newPW)
                                    self.passModify.toggle()
                                    self.nowPW=""
                                    self.newPW=""
                                    self.newPWConfirm=""
                                }
                            }){
                                Text("저장")
                                    .frame(width: 50, height: 25)
                                    .background(Color("Brown"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                        else{
                            Text("저장")
                                .frame(width: 50, height: 25)
                                .background(Color("LightGray"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                }
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("비밀번호"),
                      message: Text("\(alertMsg)"),
                      dismissButton: .default(Text("ok"))
                )
            }
        }.frame(maxWidth:.infinity, alignment:.leading)
    }
}

struct Modify:View{
    @State private var password:String=""
    @EnvironmentObject var store:Store
    @State private var nickModify:Bool=false
    @State private var nickName:String=""
    var body:some View{
        ScrollView(.vertical, showsIndicators:false){
            VStack{
                Spacer()
                Image("map")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .background(Color.red)
                    .cornerRadius(100.0)
                HStack{
                    Text("\(self.store.nick)")
                    Button(action:{
                        self.nickModify.toggle()
                        self.nickName=""
                    }){
                        Image(systemName:"pencil")
                            .foregroundColor(Color("Brown"))
                    }
                }
                if(self.nickModify){
                    HStack{
                        Text("닉네임")
                        VStack{
                            TextField("닉네임 입력", text:self.$nickName)
                            Divider()
                        }
                        if(self.nickName != ""){
                            Button(action:{
                                self.store.nick = self.nickName
                                self.nickModify.toggle()
                                self.nickName = ""
                            }){
                                Text("저장")
                                    .frame(width: 50, height: 25)
                                    .background(Color("Brown"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                        else{
                            Text("저장")
                                .frame(width: 50, height: 25)
                                .background(Color("LightGray"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                }
                
                Spacer()
                Info().environmentObject(self.store)
                Spacer()
            }
        }
    }
}

struct MyInfoModify: View {
    @EnvironmentObject var store:Store
    @State private var isOK:Bool = false
    
    var body: some View {
        VStack{
            if(self.isOK){
                Modify()
            }
            else{
                PasswordConfirm(isOK:self.$isOK)
            }
        }
        .padding(.horizontal, 30)
        .navigationBarTitle(Text("내 정보 수정"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

struct MyInfoModify_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoModify()
    }
}
