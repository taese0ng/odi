//
//  CafeReview_dispatch.swift
//  odi
//
//  Created by taese0ng on 2020/11/02.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct CafeReview_dispatch{
    func search_dispatch(store:Store, srl:Int){
        let URL = "https://cafeodi.co.kr/api/cafe/review/search"
        
        let headers: HTTPHeaders = [
            "Authorization": store.token,
            "Content-Type": "application/json"
        ]
        
        let PARAM:Parameters = [
            "cafe_srl":srl,
        ]
        
        let alamo = AF.request(URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                let json = JSON(value)
                print("value: \(json.arrayValue), \(value)")
                
                
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}
