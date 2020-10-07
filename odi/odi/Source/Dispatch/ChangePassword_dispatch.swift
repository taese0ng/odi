//
//  ChangePassword_dispatch.swift
//  odi
//
//  Created by taese0ng on 2020/10/07.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON //https://github.com/SwiftyJSON/SwiftyJSON

struct ChangePassword_dispatch{
    @Binding var showingAlert:Bool
    @Binding var alertMsg:String
    
    func dispatch(store:Store, pw:String){
        //접근하고자 하는 URL 정보
        let URL = "https://cafeodi.co.kr/auth/login/change_password"

        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "reg_type" : "user",
            "phonenum" : "\(store.callNum)",
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
                
                if(json["result"].stringValue == "change success"){
                    print("성공")
                    self.alertMsg="비밀번호변경에 성공하였습니다."
                    store.pw = pw
                }
                else{
                    self.alertMsg="비밀번호변경을 실패하였습니다."
                }
                self.showingAlert = true
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}
