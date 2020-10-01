//
//  MyReview.swift
//  odi
//
//  Created by taese0ng on 2020/08/18.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct MyReview: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators:false){
            CafeReview(myReview: true)
        }
        .navigationBarTitle(Text("내가 작성한 리뷰"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

struct MyReview_Previews: PreviewProvider {
    static var previews: some View {
        MyReview()
    }
}
