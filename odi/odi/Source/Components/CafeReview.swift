//
//  CafeReview.swift
//  odi
//
//  Created by taese0ng on 2020/08/08.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct StarRate : View{
    @State private var selected = -1
    var body: some View{
        HStack(spacing:10, content:{
            ForEach(0..<5){
                i in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width:20, height: 20)
                    .foregroundColor(self.selected >= i ? .yellow : .gray)
                    .onTapGesture {
                        self.selected = i
                }
            }
        })
    }
}
struct Review : View{
    var body : some View{
        HStack{
            VStack{
                Image("place")
                    .resizable()
                    .frame(width: 50, height: 50)
                Spacer()
            }
            VStack{
                HStack{
                    Text("얼죽아")
                        .frame(maxWidth:.infinity, alignment: .leading)
                    Spacer()
                    Text("오그니메모")
                }
                HStack{
                    StarRate()
                        .frame(maxWidth:.infinity, alignment: .leading)
                    Spacer()
                    Text("2020년 1월 1일")
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0...5, id:\.self){
                            img in
                            Image("cafeImg")
                            .resizable()
                                .frame(width:60, height: 50)
                        }
                    }
                }
                Text("커피 정말 맛있어요!!!")
                    .frame(maxWidth:.infinity, alignment: .leading)
            }
        }
    }
}

struct CafeReview: View {
    @Binding var show : Bool
    var body: some View {
        List(0...5, id:\.self){
            item in
            if item == 0{
                Review()
                .onAppear {
                       
                    withAnimation {
                        
                        self.show = true
                    }
                    
                }
                .onDisappear {
                    
                    withAnimation {
                        
                        self.show = false
                    }
                }
            }
            else{
                Review()
            }
        }
    }
}

//struct CafeReview_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeReview()
//    }
//}
