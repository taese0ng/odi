//
//  ModifyUser_dispatch.swift
//  odi
//
//  Created by taese0ng on 2020/10/07.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON //https://github.com/SwiftyJSON/SwiftyJSON

struct ModifyUser_dispatch{
    @Binding var showingAlert:Bool
    @Binding var alertMsg:String
    var URL = "https://cafeodi.co.kr/auth/modify_user"
    
    func nickName_dispatch(store:Store, nickName:String){
        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "email" : "\(store.eMail)",
            "nick_name" : "\(nickName)",
            "phonenum" : "\(store.callNum)"
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "\(store.token)",
            "Content-Type": "application/json"
        ]

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo = AF.request(self.URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                let json = JSON(value)
                
                if(json["result"].stringValue == "success"){
                    print("성공")
                    self.alertMsg="닉네임변경을 성공하였습니다."
                    store.nick = nickName
                }
                else{
                    self.alertMsg="닉네임변경을 실패하였습니다."
                }
                self.showingAlert = true
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
    
    func eMail_dispatch(store:Store, eMail:String){
        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "email" : "\(eMail)",
            "nick_name" : "\(store.nick)",
            "phonenum" : "\(store.callNum)"
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "\(store.token)",
            "Content-Type": "application/json"
        ]

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo = AF.request(self.URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                let json = JSON(value)
                
                if(json["result"].stringValue == "success"){
                    print("성공")
                    self.alertMsg="이메일변경을 성공하였습니다."
                    store.eMail = eMail
                }
                else{
                    self.alertMsg="이메일변경을 실패하였습니다."
                }
                self.showingAlert = true
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
    
    func phoneNum_dispatch(store:Store, phoneNum:String){
        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "email" : "\(store.eMail)",
            "nick_name" : "\(store.nick)",
            "phonenum" : "\(phoneNum)"
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "\(store.token)",
            "Content-Type": "application/json"
        ]

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo = AF.request(self.URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                let json = JSON(value)
                
                if(json["result"].stringValue == "success"){
                    print("성공")
                    self.alertMsg="전화번호변경을 성공하였습니다."
                    store.callNum = phoneNum
                }
                else{
                    self.alertMsg="전화번호변경을 실패하였습니다."
                }
                self.showingAlert = true
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}
