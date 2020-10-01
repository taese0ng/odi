//
//  Login_Dispatch.swift
//  odi
//
//  Created by taese0ng on 2020/10/01.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON //https://github.com/SwiftyJSON/SwiftyJSON

struct Login_dispatch{
    @Binding var showingAlert:Bool
    
    func getUserInfo(store:Store, token:String, pw:String){
        let URL = "https://cafeodi.co.kr/api/normal/user_info"
        
        let headers: HTTPHeaders = [
            "Authorization": token,
            "Content-Type": "application/json"
        ]
        
        let alamo = AF.request(URL, method: .post, parameters: nil, encoding:JSONEncoding.default, headers: headers).validate(statusCode:200..<300)
        
        alamo.responseJSON() {response in
            switch response.result{
            case .success(let value):
                print("user : \(value)")
                let json = JSON(value)
                store.id = json["user_id"].stringValue
                store.pw = pw
                store.name = json["user_name"].stringValue
                store.sex = json["user_gender"].stringValue
                store.birth = json["user_birth"].stringValue
                store.eMail = json["user_email"].stringValue
                store.callNum = json["user_phone"].stringValue
                store.nick = json["user_nick_name"].stringValue
                
            case .failure(let error):
                print("error : \(String(describing: error.errorDescription))")
            }
        }
    }
    
    func dispatch(store:Store, id:String, pw:String){
        //접근하고자 하는 URL 정보
        let URL = "https://cafeodi.co.kr/auth/login"

        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "reg_type" : "user",
            "id" : "\(id)",
            "password" : "\(pw)"
        ]

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo = AF.request(URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                let json = JSON(value)
                if(json["result"].stringValue == "success"){
                    print("성공")
                    self.getUserInfo(store: store, token: json["token"].stringValue, pw:pw)
                    store.isLogin = true
                }
                else{
                    showingAlert = true
                }
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}
