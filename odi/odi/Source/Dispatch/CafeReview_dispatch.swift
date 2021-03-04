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
//    @Binding var reviewList:Array<cafe_reviews_interface>
    @Binding var reviewList:Array<myReview_dispatch.cafe_review_interface>
    
//    struct cafe_reviews_interface:Hashable{
//        var review_srl:Int;
//        var user_nick_name:String;
//        var review_score:Int;
//        var review_content:String;
//        var review_reg_date:String;
//    }
    
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
                let testList:Array<JSON> = json.arrayValue
                reviewList = []
                
                for i in testList{
//                    let one = cafe_reviews_interface(review_srl:i["review_srl"].intValue,
//                                                     user_nick_name:i["user_nick_name"].stringValue,
//                                                     review_score:i["review_score"].intValue,
//                                                     review_content:i["review_content"].stringValue,
//                                                     review_reg_date:i["review_reg_date"].stringValue)
                    let one = myReview_dispatch.cafe_review_interface(review_srl:i["review_srl"].intValue,
                                                    user_nick_name:i["user_nick_name"].stringValue,
                                                    cafe_srl:i["cafe_srl"].intValue,
                                                    review_score:i["review_score"].intValue,
                                                    review_content:i["review_content"].stringValue,
                                                    review_reg_date:i["review_reg_date"].stringValue,
                                                    review_reg_ip:i["review_reg_ip"].stringValue,
                                                    review_image_count:i["review_image_count"].intValue,
                                                    review_is_going_to_del:i["review_is_going_to_del"].stringValue,
                                                    review_del_date:i["review_del_date"].stringValue)
                    reviewList.append(one)
                }
                
                
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}

struct myReview_dispatch{
    @Binding var reviewList:Array<cafe_review_interface>
    
    struct cafe_review_interface: Hashable{
        var review_srl:Int
        var user_nick_name:String
        var cafe_srl:Int
        var review_score:Int
        var review_content:String
        var review_reg_date: String
        var review_reg_ip:String
        var review_image_count:Int
        var review_is_going_to_del:String
        var review_del_date:String
    }
    
    func myReviewList_dispatch(store:Store){
        let URL = "https://cafeodi.co.kr/api/normal/user_review_list"
        
        let headers: HTTPHeaders = [
            "Authorization": store.token,
            "Content-Type": "application/json"
        ]
        
        let PARAM:Parameters = [:]
        
        let alamo = AF.request(URL, method: .post, parameters: PARAM, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                let json = JSON(value)
                print("value: \(json.arrayValue), \(value)")
                let testList:Array<JSON> = json.arrayValue
                reviewList = []
                
                for i in testList{
                    let one = cafe_review_interface(review_srl:i["review_srl"].intValue,
                                                    user_nick_name:i["user_nick_name"].stringValue,
                                                    cafe_srl:i["cafe_srl"].intValue,
                                                    review_score:i["review_score"].intValue,
                                                    review_content:i["review_content"].stringValue,
                                                    review_reg_date:i["review_reg_date"].stringValue,
                                                    review_reg_ip:i["review_reg_ip"].stringValue,
                                                    review_image_count:i["review_image_count"].intValue,
                                                    review_is_going_to_del:i["review_is_going_to_del"].stringValue,
                                                    review_del_date:i["review_del_date"].stringValue)
                    reviewList.append(one)
                }
                
                
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}
