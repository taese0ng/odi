//
//  LocalDataStorage.swift
//  odi
//
//  Created by taese0ng on 2020/11/18.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI
import Foundation

struct storageData:Codable,Hashable{
    let srl: Int!
    let name: String!
}

struct LocalDataStorage {
    func setData(srl: Int, name: String){
        var data:[storageData] = getData()
        
        data.append(storageData(srl: srl, name: name))
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(data), forKey: "recentCafe")
        
        print("setLocalStorage : ")
        dump(data)
    }

    func getData() -> Array<storageData>{
        var dataList: [storageData]?
        
        if let data = UserDefaults.standard.value(forKey: "recentCafe") as? Data {
            dataList = try? PropertyListDecoder().decode([storageData].self, from:data)
        }
        
        print("getLocalStorage : ")
        dump(dataList)
        return dataList ?? []
    }
    
//    https://kyungmosung.github.io/2020/08/17/swift-userdefaults-customobject/
}
