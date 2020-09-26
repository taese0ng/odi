//
//  Notice.swift
//  odi
//
//  Created by taese0ng on 2020/09/10.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct NoticeItems: View{
    var title:String
    var date:String
    var content:String
    @State private var isOpen:Bool = false
    
    var body:some View{
        VStack{
            Button(action:{
                withAnimation{
                    self.isOpen.toggle()
                }
            }){
                VStack{
                    HStack{
                        Text("\(self.title)")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    Text("\(self.date)")
                        .foregroundColor(Color("Brown"))
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
            }
            
            if(self.isOpen){
                Text("\(content)")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.vertical, 10)
            }
        }
        .background(Color.white)
        .frame(maxWidth:.infinity, alignment: .leading)
    }
}

struct Notice: View {
    var body: some View {
        ScrollView{
            VStack{
                ForEach(1..<5){
                    _ in
                    NoticeItems(title:"앱 관련 공지입니다.", date:"2020.08.09", content:"공지사항 내용입니다.")
                        .padding(10)
                }
            }
        }
        .navigationBarTitle(Text("공지사항"), displayMode: .inline)
        .navigationBarColor(.white)
    }
}

struct Notice_Previews: PreviewProvider {
    static var previews: some View {
        Notice()
    }
}
