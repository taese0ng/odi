//
//  SignUpThree.swift
//  odi
//
//  Created by taese0ng on 2020/09/09.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct SignUpThree: View {
    @State private var callNum:String = ""
    @State private var cerify:String = ""
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("본인인증")
            
            HStack{
                VStack{
                    TextField("휴대폰 번호", text: self.$callNum)
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
            
            Button(action:{}){
                Text("회원가입 완료")
                    .frame(width:300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(5)
            }
            
            Spacer()
        }
        .padding(.horizontal, 30)
    }
}

struct SignUpThree_Previews: PreviewProvider {
    static var previews: some View {
        SignUpThree()
    }
}
