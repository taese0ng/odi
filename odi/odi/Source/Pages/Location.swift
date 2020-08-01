//
//  Location.swift
//  odi
//
//  Created by taese0ng on 2020/07/24.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Location: View {
    @ObservedObject var store = Store()
    var body: some View {
        NavigationView{
            VStack{
                TopBar(title:"지역")
                Spacer().frame(height:40)
                Text("어디 카페를 찾으시나요?")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image("map").resizable()
                    .aspectRatio(contentMode: .fit)
                
            }.frame(minWidth:0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading)
            .navigationBarTitle("")
            .navigationBarHidden(self.store.isNavigationBarHidden)
            .onAppear(){
                self.store.isNavigationBarHidden=true
            }
            .onDisappear(){
                self.store.isNavigationBarHidden=false
            }
        }
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
        Location()
    }
}
