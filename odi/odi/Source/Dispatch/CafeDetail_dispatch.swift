//
//  CafeDetail_dispatch.swift
//  odi
//
//  Created by taese0ng on 2020/11/01.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct CafeDetail_dispatch {
    @Binding var cafe_srl_info:Cafe_srl_info
    
    func dispatch(store:Store, srl:Int){
        let URL = "https://cafeodi.co.kr/api/cafe/search"
        
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
                print("value: \(json)")
                
                var menu_list = [Cafe_srl_info.Menu]();
                for item in json[0]["menu"].arrayValue{
                    let mn = Cafe_srl_info.Menu(menu_type: item["menu_type"].stringValue,
                                  menu_name: item["menu_name"].stringValue,
                                  menu_price: item["menu_price"].stringValue)
                    menu_list.append(mn)
                }
                print("array:\(menu_list)")
                let detail_info = Cafe_srl_info(cafe_name:json[0]["cafe_name"].stringValue,
                                                cafe_category:json[0]["cafe_category"].stringValue,
                                                cafe_review_score_avg:json[0]["cafe_review_score_avg"].intValue,
                                                cafe_review_count:json[0]["cafe_review_count"].intValue,
                                                cafe_address:json[0]["cafe_address"].stringValue,
                                                cafe_coupon:json[0]["cafe_coupon"].stringValue,
                                                cafe_sns_account:json[0]["cafe_sns_account"].stringValue,
                                                cafe_phone:json[0]["cafe_phone"].stringValue,
                                                cafe_oneline_intro:json[0]["cafe_oneline_intro"].stringValue,
                                                cafe_week_workday:json[0]["cafe_week_workday"].stringValue,
                                                cafe_weekend_workday:json[0]["cafe_weekend_workday"].stringValue,
                                                cafe_closed_date:json[0]["cafe_closed_date"].stringValue,
                                                cafe_intro:json[0]["cafe_intro"].stringValue,
                                                cafe_info:json[0]["cafe_info"].stringValue,
                                                cafe_image_count:json[0]["cafe_image_count"].intValue,
                                                menu:menu_list,
                                                cafe_tag:json[0]["cafe_tag"].arrayValue.map{$0["tag_content"].stringValue},
                                                is_like:json[0]["is_like"].stringValue,
                                                is_coupon_use:json[0]["is_coupon"].stringValue)
                cafe_srl_info = detail_info
//                print("detail_info:\(detail_info)")
//                print("cafe_srl_info:\(cafe_srl_info)")
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
}
