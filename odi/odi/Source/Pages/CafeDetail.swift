//
//  CafeDetail.swift
//  odi
//
//  Created by taese0ng on 2020/08/04.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct CafeDetail: View {
    var propsText:String
    var body: some View {
        Text("\(propsText)")
    }
}

struct CafeDetail_Previews: PreviewProvider {
    static var previews: some View {
        CafeDetail(propsText: "dd")
    }
}
