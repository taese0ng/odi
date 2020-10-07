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
    @Published var token:String = ""
    @Published var id:String = ""
    @Published var pw:String = ""
    @Published var eMail:String = ""
    @Published var nick:String = ""
    @Published var location_agree:String = "N"
    @Published var callNum:String = ""
    @Published var birth:String = ""
    @Published var sex:String = ""
    @Published var name:String = ""
    @Published var selectionArea:String="중구(동성로,삼덕동,교동,대봉동)"
    @Published var MyPage_root:Bool = false
}
