//
//  MyReview.swift
//  odi
//
//  Created by taese0ng on 2020/08/18.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct MyReview: View {
    @EnvironmentObject var store:Store
    @State private var reviewList:Array<myReview_dispatch.cafe_review_interface> = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators:false){
            VStack{
                ForEach(reviewList, id:\.self){
                    item in Review(myReview: true, data: item)
                }
            }.padding(.horizontal, 20)
        }
        .navigationBarTitle(Text("내가 작성한 리뷰"), displayMode: .inline)
        .navigationBarColor(.white)
        .onAppear{
            myReview_dispatch(reviewList:$reviewList).myReviewList_dispatch(store: store)
        }
    }
}

struct MyReview_Previews: PreviewProvider {
    static var previews: some View {
        MyReview()
    }
}
