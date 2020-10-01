//
//  SignUpFour.swift
//  odi
//
//  Created by taese0ng on 2020/09/11.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI
import Alamofire

struct SignUpFour: View {
    @EnvironmentObject var store:Store
    @State private var cerify:String = ""
    @State private var showingAlert:Bool=false
    @State private var signUp_success:Bool=false
    
    var answer:String = "123"
    
    func check()->Bool{
        if(self.answer == self.cerify){
            return true
        }
        return false
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("본인인증")
                .padding(.bottom, 50)
            HStack{
                VStack{
                    TextField("휴대폰 번호", text: self.$store.callNum)
                        .keyboardType(.numberPad)
                    Divider()
                    .background(Color.black)
                }
                Button(action:{}){
                    Text("인증번호 전송")
                        .frame(width:120, height: 40)
                        .foregroundColor(.white)
                        .background(Color("Brown"))
                        .cornerRadius(5)
                }
            }
            
            TextField("인증번호 입력", text:self.$cerify)
             .keyboardType(.numberPad)
            Divider()
            .background(Color.black)
            
            Spacer()
            
            
            if(self.check()){
                Button(action:{
                    SignUp_dispatch(signUp_success: $signUp_success,showingAlert:$showingAlert).dispatch(store:store)
                }){
                    Text("회원가입 완료")
                        .frame(width:300, height: 50)
                        .foregroundColor(.white)
                        .background(Color("Brown"))
                        .cornerRadius(5)
                }.alert(isPresented: $showingAlert) {
                    switch self.signUp_success{
                    case true:
                        return
                            Alert(title: Text("회원가입"),
                                  message: Text("회원가입에 성공하였습니다."),
                                  dismissButton: .default(Text("ok"), action: {
                                    store.MyPage_root = false
                                  })
                            )
                    case false:
                        return
                            Alert(title: Text("회원가입"),
                                  message: Text("회원가입에 실패하였습니다."),
                                  dismissButton: .default(Text("ok"))
                            )
                    }
                }
            }
            else{
                Text("회원가입 완료")
                .frame(width:300, height: 50)
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(5)
            }
            
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .navigationBarTitle(Text("회원가입 4/4"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

struct SignUpFour_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFour()
    }
}
