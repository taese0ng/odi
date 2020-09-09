//
//  MyReview.swift
//  odi
//
//  Created by taese0ng on 2020/08/18.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct MyReview: View {
    @State private var show:Bool = false
    var body: some View {
        VStack{
            CafeReview(show:self.$show)
        }
    }
}

struct MyReview_Previews: PreviewProvider {
    static var previews: some View {
        MyReview()
    }
}
