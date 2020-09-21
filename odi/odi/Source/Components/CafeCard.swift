//
//  HotCafeCard.swift
//  odi
//
//  Created by taese0ng on 2020/08/21.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct CafeCard: View {
    var screenWidth = UIScreen.main.bounds.size.width
    var cafeName : String
    var body: some View {
        VStack{
            Image("cafeImg")
                .frame(width:200, height:170)
                .cornerRadius(radius: 15, corners:[.topLeft, .topRight])
            Text("\(cafeName)")
                .frame(maxWidth: .infinity, alignment: .leading)
        }.frame(width:200, height: 200)
            
    }
}

struct CafeCard_Previews: PreviewProvider {
    static var previews: some View {
        CafeCard(cafeName:"[대구] OOO 카페")
    }
}
