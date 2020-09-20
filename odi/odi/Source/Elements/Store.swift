//
//  SignUpInfo.swift
//  odi
//
//  Created by taese0ng on 2020/09/14.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

class Store: ObservableObject{
    @Published var isLogin:Bool = false
    @Published var name = "더미이름"
    @Published var birth = "1996.01.01"
    @Published var sex = "남"
    @Published var id = "더미아이디"
    @Published var pw = "123"
    @Published var eMail = "더미이메일@더미.더미"
    @Published var nick = "닉네임"
    @Published var callNum = "010-0000-0000"
    @Published var selectionArea:String="중구(동성로,삼덕동,교동,대봉동)"
}
