//
//  GoogleMaps.swift
//  odi
//
//  Created by taese0ng on 2020/11/17.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI
import GoogleMaps
import Alamofire
import SwiftyJSON

struct GoogleMapsView: UIViewRepresentable {
    @State var Latitude = -33.86
    @State var Longitude = 151.20
    private let zoom: Float = 15.0
    
    func getAddress(address:String){
//        let baseString = "https://maps.googleapis.com/maps/api/geocode/json?address="
        let koreanEndPoint = address
        let escapingCharacterSet: CharacterSet = {
            var cs = CharacterSet.alphanumerics
            cs.insert(charactersIn: "-_.~")
            return cs
        }()
        
        let escapedKoreanEndPoint = koreanEndPoint.addingPercentEncoding(withAllowedCharacters: escapingCharacterSet)!
        
        let key : String = "AIzaSyDpiaajKm_gx6KL3yopzleJ0vaLg8CTHUQ"
//        let postParameters:[String: Any] = [ "address": address,"key":key]
        let url : String = "https://maps.googleapis.com/maps/api/geocode/json?address=\(escapedKoreanEndPoint)&key=\(key)"

        let alamo = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
        
        alamo.responseJSON() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("GoogleMaps value: \(value)")
                // This IP, site or mobile application is not authorized to use this API key.
                //해결법 : https://tristan91.tistory.com/148
                // self.Latitude, self.Longitude에 대입하면됨.
                
            //통신실패
            case .failure(let error):
                print("GoogleMaps error: \(String(describing: error.errorDescription))")
            }
        }
        
    }
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: self.Latitude, longitude: self.Longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        
    }
}
