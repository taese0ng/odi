//
//  SignUp.swift
//  odi
//
//  Created by taese0ng on 2020/10/01.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import Foundation
import Alamofire


func SignUp_dispatch(store:Store)->Bool{
    var signUp_success:Bool = false
    //접근하고자 하는 URL 정보
    let URL = "https://cafeodi.co.kr/auth/register"

    //전송할 파라미터 정보
    let PARAM:Parameters = [
        "reg_type" : "user",
        "id" : "\(store.id)",
        "password" : "\(store.pw)",
        "email" : "\(store.eMail)",
        "nick_name" : "\(store.nick)",
        "recommand" :"x",
        "is_agree":"\(store.location_agree)",
        "phonenum":"\(store.callNum)",
        "birth":"\(store.birth)",
        "gender":"\(store.sex)",
        "name":"\(store.name)"
    ]
    

    //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
    let alamo = AF.request(URL, method: .post, parameters: PARAM).validate(statusCode: 200..<300)
    //결과값으로 문자열을 받을 때 사용
    alamo.responseString() { response in
        switch response.result
        {
        //통신성공
        case .success(let value):
            print("value: \(value)")
            print("store: \(store.id)")
            print("\(store.pw)")
            print("\(store.eMail)")
            print("\(store.nick)")
            print("\(store.location_agree)")
            print("\(store.callNum)")
            print("\(store.birth)")
            print("\(store.sex)")
            print("\(store.name)")
            store.id = ""
            store.pw = ""
            store.eMail = ""
            store.nick = ""
            store.location_agree = "N"
            store.callNum = ""
            store.birth = ""
            store.sex = ""
            store.name = ""
            signUp_success = true
//            store.isLogin = true
        //통신실패
        case .failure(let error):
            print("error: \(String(describing: error.errorDescription))")
        }
    }
    
    return signUp_success
}
