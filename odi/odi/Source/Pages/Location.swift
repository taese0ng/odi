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
    
    var body: some View {
        NavigationView{
            VStack{
                TopBar(title:"지역")
                Spacer().frame(height:40)
                Text("어디 카페를 찾으시나요?")
                    .padding(.horizontal, 20)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image("map")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                NavigationLink(destination: SelectArea(showArea:self.$showArea).environmentObject(self.store), isActive:$showArea, label: {
                    Text("일단 이거 눌러라")
                })
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
