//
//  SignUpOne.swift
//  odi
//
//  Created by taese0ng on 2020/08/18.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct CheckView: View {
    @Binding var isChecked:Bool
    var title:String
    var necessary:Bool
    
    var body: some View {
        Button(action: {
            self.isChecked.toggle()
        }){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
                Text(title)
                if(self.necessary){
                    Text("(필수)")
                        .foregroundColor(.red)
                }
            }
        }
        .foregroundColor(.black)
    }
}

struct SignUpOne: View {
    @State private var necessaryNum:Int = 0
    @State private var service:Bool = false
    @State private var personal:Bool = false
    @State private var location:Bool = false
    func allToggle(){
        if(self.service && self.personal && self.location){
            self.service = false
            self.personal = false
            self.location = false
        }
        else{
            self.service = true
            self.personal = true
            self.location = true
        }
        
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            Button(action: {
                self.allToggle()
            }){
                HStack{
                    if(self.service && self.personal && self.location){
                        Image(systemName: "checkmark.square")
                    }
                    else{
                        Image(systemName: "square")
                    }
                    Text("전체동의")
                }
            }
            .frame(maxWidth:.infinity, alignment: .leading)
            .font(.custom("allAgree", size: 25))
            .foregroundColor(.black)
            
            VStack{
                HStack{
                    CheckView(isChecked: self.$service, title:"서비스 이용약관 동의", necessary: true)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    Button(action:{}){
                        Text("보기")
                            .foregroundColor(.gray)
                    }
                }
                
                HStack{
                    CheckView(isChecked: self.$personal, title:"개인정보 처리방침 동의", necessary: true)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    Button(action:{}){
                        Text("보기")
                            .foregroundColor(.gray)
                    }
                }
                
                HStack{
                    CheckView(isChecked: self.$location, title:"위치정보약관 동의", necessary: false)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    Button(action:{}){
                        Text("보기")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.leading, 10)
            .padding(.top, 20)
            
            Spacer()
            
            Button(action:{}){
                if(self.service && self.personal){
                    Text("다음")
                        .frame(width:300, height: 50)
                        .background(Color("Brown"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                else{
                    Text("다음")
                    .frame(width:300, height: 50)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 30)
    }
}

struct SignUpOne_Previews: PreviewProvider {
    static var previews: some View {
        SignUpOne()
    }
}
