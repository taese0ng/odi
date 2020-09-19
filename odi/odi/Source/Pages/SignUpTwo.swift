//
//  SignUpTwo.swift
//  odi
//
//  Created by taese0ng on 2020/09/09.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI
import Combine

enum Gender: String {
    case male = "남"
    case female = "여"
}

struct RadioButtonGroups: View {
    @Binding var selectedId: String
    
    var body: some View {
        HStack {
            radioMaleMajority
            radioFemaleMajority
        }
    }
    
    var radioMaleMajority: some View {
        RadioButton(
            id: Gender.male.rawValue,
            label: Gender.male.rawValue,
            isMarked: selectedId == Gender.male.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioFemaleMajority: some View {
        RadioButton(
            id: Gender.female.rawValue,
            label: Gender.female.rawValue,
            isMarked: selectedId == Gender.female.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
    }
}

struct SignUpTwo: View {
    @EnvironmentObject var store:Store
//    @State private var name:String = ""
//    @State private var birth:String = ""
//    @State private var sex:String = ""

    func check() -> Bool{
        var answer:Bool = false
        if(self.store.name != "" && self.store.birth != "" && self.store.sex != ""){
            answer = true
        }
        else{
            answer = false
        }
        return answer
    }
    
    var body: some View {
            VStack{
                Text("회원정보")
                .padding(.vertical, 20)
                
                VStack{
                    Text("이름")
                        .frame(maxWidth:.infinity, alignment: .leading)
                    TextField("이름", text: self.$store.name)
                    Divider()
                }.padding(.vertical, 20)
                
                VStack{
                    Text("생년월일")
                        .frame(maxWidth:.infinity, alignment: .leading)
                    TextField("생년월일", text: self.$store.birth)
                    Divider()
                }.padding(.vertical, 20)
                
                VStack{
                    Text("성별")
                        .frame(maxWidth:.infinity, alignment: .leading)
                    RadioButtonGroups(selectedId: self.$store.sex)
                }.padding(.vertical, 20)
                
                Spacer()
                Button(action:{}){
                    if(self.check()){
                        NavigationLink(destination: SignUpThree().environmentObject(self.store)){
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
                Spacer()
            }
            .padding(.horizontal, 30)
            .navigationBarTitle(Text("회원가입 2/4"), displayMode: .inline)
    }
}

struct SignUpTwo_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTwo()
    }
}
