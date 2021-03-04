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

struct CheckUser_dispatch{
    @Binding var checked_id:Bool
    @Binding var checked_nick:Bool
    
    func dispatch_nickname(store:Store){
        //접근하고자 하는 URL 정보
        let URL = "https://cafeodi.co.kr/auth/check_data"

        //전송할 파라미터 정보
        let PARAM_nick:Parameters = [
            "reg_type" : "user",
            "user_type" : "nick_name",
            "check_data" : "\(store.nick)"
        ]
        

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo_nick = AF.request(URL, method: .post, parameters: PARAM_nick, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
        //결과값으로 문자열을 받을 때 사용
        
        alamo_nick.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                self.checked_nick = true
                break
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
                break
            }
        }
    }
    
    func dispatch(store:Store){
        //접근하고자 하는 URL 정보
        let URL = "https://cafeodi.co.kr/auth/check_data"

        //전송할 파라미터 정보
        let PARAM_nick:Parameters = [
            "reg_type" : "user",
            "user_type" : "nick_name",
            "check_data" : "\(store.nick)"
        ]
        

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo_nick = AF.request(URL, method: .post, parameters: PARAM_nick, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
        //결과값으로 문자열을 받을 때 사용
        
        alamo_nick.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                self.checked_nick = true
                break
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
                break
            }
        }
        
        let PARAM_id:Parameters = [
            "reg_type" : "user",
            "user_type" : "id",
            "check_data" : "\(store.id)"
        ]
        

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo_id = AF.request(URL, method: .post, parameters: PARAM_id, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
        //결과값으로 문자열을 받을 때 사용
        
        alamo_id.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                self.checked_id = true
                break
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
                break
            }
        }
        
    }

}
