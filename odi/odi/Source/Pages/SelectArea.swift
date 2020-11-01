//
//  SelectArea.swift
//  odi
//
//  Created by taese0ng on 2020/09/20.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct SelectArea: View {
    @EnvironmentObject var store:Store
    @Binding var showArea:Bool
    
    var areaList = ["중구(동성로,삼덕동,교동,대봉동)", "수성구(수성못,범어,황금동)", "남구(앞산,봉덕동,대명동)", "달서구(상인,계명대,성서)/달성군/서구", "북구(경북대,태전동)/칠곡지구/팔공산", "동구(동대구역,율하)"]
    var body: some View {
        VStack{
            List(self.areaList, id:\.self){ area in
                Button(action:{
                    self.store.selectionArea = area
                    self.showArea=false
                }){
                    Text("\(area)")
                        .padding(.vertical, 10)
                }
            }
        }
        .navigationBarTitle(Text("세부지역 선택"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

//struct SelectArea_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectArea()
//    }
//}
