//
//  SignUpInfo.swift
//  odi
//
//  Created by taese0ng on 2020/09/14.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

class SignUpInfo: ObservableObject{
    @Published var name = ""
    @Published var birth = ""
    @Published var sex = ""
    @Published var id = ""
    @Published var pw = ""
    @Published var eMail = ""
    @Published var nick = ""
    @Published var callNum = ""
}
