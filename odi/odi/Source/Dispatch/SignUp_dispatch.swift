//
//  SignUp.swift
//  odi
//
//  Created by taese0ng on 2020/10/01.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON

struct SignUp_dispatch{
    @Binding var signUp_success:Bool
    @Binding var showingAlert:Bool
    
    func dispatch(store:Store){
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
        let alamo = AF.request(URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
        //결과값으로 문자열을 받을 때 사용
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                store.id = ""
                store.pw = ""
                store.eMail = ""
                store.nick = ""
                store.location_agree = "N"
                store.callNum = ""
                store.birth = ""
                store.sex = ""
                store.name = ""
                self.signUp_success = true
                self.showingAlert = true
                break
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
                self.signUp_success = false
                self.showingAlert = true
                break
            }
        }
        
    }

}
