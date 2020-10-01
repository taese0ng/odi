//
//  CafeList_dispatch.swift
//  odi
//
//  Created by taese0ng on 2020/10/01.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct CafeList_dispatch{
    func region_dispatch(){
        //접근하고자 하는 URL 정보
        let URL = "https://cafeodi.co.kr/api/cafe/list_search"

        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "cafe_name":"테스트stl",
            "list_type":"region",
            "region_type":"review",
            "region_value":"구미",
            "user_latitude":"36.145519,128.392291"
        ]

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo = AF.request(URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
    
    func search_dispatch(){
        //접근하고자 하는 URL 정보
        let URL = "https://cafeodi.co.kr/api/cafe/list_search"

        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "cafe_name":"테스트stl",
            "list_type":"search",
            "search_type":"cafe_name",
            "search_value":"테스트",
            "user_latitude":"36.145519,128.392291"
        ]

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo = AF.request(URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}
