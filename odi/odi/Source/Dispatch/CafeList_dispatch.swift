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
    @ObservedObject var locationManager = LocationManager()
    @Binding var cafeList:Array<cafe_info>
    
    struct cafe_info:Hashable{
        var cafe_name:String
        var cafe_review_score_avg:Int?
        var cafe_review_count:Int?
        var cafe_address:String
        var cafe_coupon:String
        var cafe_closed_date:String?
        var cafe_image_count:Int
        var cafe_tag:Array<String>
        var is_like:String
        var is_coupon_use:String
        var distance:Float
        var cafe_srl:Int
    }
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    func region_dispatch(){
        //접근하고자 하는 URL 정보
        let URL = "https://cafeodi.co.kr/api/cafe/list_search"

        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "list_type":"region",
            "region_type":"review",
            "region_value":"구미",
//            "user_latitude":"36.145519,128.392291"
            "user_latitude":"\(userLatitude),\(userLongitude)"
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
    
    func search_dispatch(store:Store, search_type:String, search_value:String){
        //접근하고자 하는 URL 정보
        let URL = "https://cafeodi.co.kr/api/cafe/list_search"
        
        let headers: HTTPHeaders = [
            "Authorization": "\(store.token)",
            "Content-Type": "application/json"
        ]
        
        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "list_type":"search",
//            "search_type":"\(search_type)",
//            "search_value":"\(search_value)",
//            "user_latitude":"\(userLatitude),\(userLongitude)",
                        "search_type":"cafe_name",
                        "search_value":"테스트",
                        "user_latitude":"36.145519,128.392291"
        ]

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo = AF.request(URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                let json = JSON(value)
//                print("value: \(json)")
                let testList:Array<JSON> = json.arrayValue
                cafeList = []
                for i in testList{
                    let one = cafe_info(cafe_name:i["cafe_name"].stringValue,
                                  cafe_review_score_avg:i["cafe_review_score_avg"].intValue,
                                  cafe_review_count:i["cafe_review_count"].intValue,
                                  cafe_address:i["cafe_address"].stringValue,
                                  cafe_coupon:i["cafe_coupon"].stringValue,
                                  cafe_closed_date:i["cafe_close_date"].stringValue,
                                  cafe_image_count:i["cafe_image_count"].intValue,
                                  cafe_tag:i["cafe_tag"].arrayValue.map { $0["tag_content"].stringValue},
                                  is_like:i["is_like"].stringValue,
                                  is_coupon_use:i["is_coupon_use"].stringValue,
                                  distance:i["distance"].floatValue,
                                  cafe_srl: i["cafe_srl"].intValue)
                    cafeList.append(one)
                    print(one)
                }
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}


struct CafeList_isLike_dispatch{
    @Binding var cafeList:Array<CafeList_dispatch.cafe_info>
    
    func isLikeList(store:Store){
        //접근하고자 하는 URL 정보
        let URL = "https://cafeodi.co.kr/api/normal/user_like"
        
        let headers: HTTPHeaders = [
            "Authorization": "\(store.token)",
            "Content-Type": "application/json"
        ]
        
        //전송할 파라미터 정보
        let PARAM:Parameters = [
            "like_type": "search"
        ]

        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo = AF.request(URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                let json = JSON(value)
                print("isLike List value: \(json)")
                let testList:Array<JSON> = json.arrayValue
                
                for i in testList{
                    let one = CafeList_dispatch.cafe_info(cafe_name:i["cafe_name"].stringValue,
                                  cafe_review_score_avg:i["cafe_review_score_avg"].intValue,
                                  cafe_review_count:i["cafe_review_count"].intValue,
                                  cafe_address:i["cafe_address"].stringValue,
                                  cafe_coupon:i["cafe_coupon"].stringValue,
                                  cafe_closed_date:i["cafe_close_date"].stringValue,
                                  cafe_image_count:i["cafe_image_count"].intValue,
                                  cafe_tag:i["cafe_tag"].arrayValue.map { $0["tag_content"].stringValue},
                                  is_like:i["is_like"].stringValue,
                                  is_coupon_use:i["is_coupon_use"].stringValue,
                                  distance:i["distance"].floatValue,
                                  cafe_srl: i["cafe_srl"].intValue)
                    cafeList.append(one)
                    print(one)
                }
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}
