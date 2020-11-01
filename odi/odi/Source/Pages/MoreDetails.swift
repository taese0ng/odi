//
//  MoreDetails.swift
//  odi
//
//  Created by taese0ng on 2020/09/10.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct MoreDetails: View {
    @State private var odiInfo:Bool = false
    @State private var personalInfo:Bool = false
    @State private var serviceUse:Bool = false
    @State private var locationUse:Bool = false
    
    var body: some View {
        VStack{
            NavigationLink(destination: Notice(), label: {
                HStack{
                    Image("notification")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width:40, height: 40)
                        .foregroundColor(Color("Brown"))
                    Text("공지사항")
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.vertical, 10)
            })
            Divider()
                .background(Color("Brown"))
            Button(action:{
                if let url = URL(string: "http://pf.kakao.com/_qxeXxhxb") {
                    UIApplication.shared.open(url, options: [:])
                }
            }){
                HStack{
                    Image("help")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width:40, height: 40)
                    .foregroundColor(Color("Brown"))
                    Text("카카오톡 1:1 문의")
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.vertical, 10)
            }
            Divider()
            .background(Color("Brown"))
            
            Button(action:{
                withAnimation{
                    self.odiInfo.toggle()
                }
            }){
                HStack{
                    Image("error")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width:40, height: 40)
                    .foregroundColor(Color("Brown"))
                    Text("오디 정보")
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.vertical, 10)
            }
            
            if(self.odiInfo){
                VStack{
                    Button(action:{
                        withAnimation{
                            self.locationUse = false
                            self.personalInfo = false
                            self.serviceUse.toggle()
                        }
                    }){
                        HStack{
                            Text("서비스 이용약관")
                                .foregroundColor(Color("LightGray"))
                            if(self.serviceUse){
                                Image(systemName: "chevron.up")
                                    .foregroundColor(Color("LightGray"))
                            }
                            else{
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color("LightGray"))
                            }
                        }
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .padding(.vertical, 5)
                    }
                    if(self.serviceUse){
                        ScrollView{
                            Text(ServiceUse().service)
                        }
                        .frame(height: 250, alignment: .leading)
                    }
                    
                    Button(action:{
                        withAnimation{
                            self.locationUse = false
                            self.personalInfo.toggle()
                            self.serviceUse = false
                        }
                    }){
                        HStack{
                            Text("개인정보처리방침")
                                .foregroundColor(Color("LightGray"))
                            if(self.personalInfo){
                                Image(systemName: "chevron.up")
                                    .foregroundColor(Color("LightGray"))
                            }
                            else{
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color("LightGray"))
                            }
                        }
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .padding(.vertical, 5)
                    }
                    if(self.personalInfo){
                        ScrollView{
                            Text(PersonalInfo().info)
                        }
                        .frame(height: 250, alignment: .leading)
                    }
                    
                    Button(action:{
                        withAnimation{
                            self.locationUse.toggle()
                            self.personalInfo = false
                            self.serviceUse = false
                        }
                    }){
                        HStack{
                            Text("위치 정보 이용 약관")
                                .foregroundColor(Color("LightGray"))
                            if(self.locationUse){
                                Image(systemName: "chevron.up")
                                    .foregroundColor(Color("LightGray"))
                            }
                            else{
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color("LightGray"))
                            }
                        }
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .padding(.vertical, 5)
                    }
                    if(self.locationUse){
                        ScrollView{
                            Text(LocationUse().location)
                        }
                        .frame(height: 250, alignment: .leading)
                    }
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
            
            Spacer()
        }
        .navigationBarTitle(Text("더보기"), displayMode: .inline)
        .navigationBarColor(.white)
        .padding(.horizontal,30)
    }
}

struct MoreDetails_Previews: PreviewProvider {
    static var previews: some View {
        MoreDetails()
    }
}
