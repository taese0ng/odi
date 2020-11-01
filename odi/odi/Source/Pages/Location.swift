//
//  Location.swift
//  odi
//
//  Created by taese0ng on 2020/07/24.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Location: View {
    @State private var showArea:Bool = false
    @EnvironmentObject var store:Store
    var screenWidth = UIScreen.main.bounds.size.width
    var screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        NavigationView{
            VStack{
                TopBar(title:"지역")
//                Spacer().frame(height:40)
                Text("어디 카페를 찾으시나요?")
                    .fontWeight(.bold)
                    .font(.body)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack{
                    Image("map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    NavigationLink(destination: SelectArea(showArea:self.$showArea).environmentObject(self.store), isActive:$showArea, label: {
                        Text("")
                            .frame(width:100, height: 100)
                            .cornerRadius(10)
                    })
                    .position(x: self.screenWidth*0.65, y: self.screenHeight*0.37)
                }
                .frame(maxHeight:.infinity, alignment: .center)
                
            }.frame(minWidth:0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .top)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarColor(.white)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
        Location()
    }
}
