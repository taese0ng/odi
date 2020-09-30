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
    @Published var id = ""
    @Published var pw = ""
    @Published var eMail = ""
    @Published var nick = ""
    @Published var location_agree = "N"
    @Published var callNum = ""
    @Published var birth = ""
    @Published var sex = ""
    @Published var name = ""
    @Published var selectionArea:String="중구(동성로,삼덕동,교동,대봉동)"
    @Published var MyPage_root:Bool = false
}
