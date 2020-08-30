//
//  DetailView.swift
//  odi
//
//  Created by taese0ng on 2020/08/07.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct DetailBtns: View{
    @Binding var modal:Bool
    @Binding var modalMenu:String
    var body: some View{
        HStack{
            Button(action:{
                self.modalMenu = "cafeMenu"
                self.modal.toggle()
            }){
                Text("메뉴보기")
                .foregroundColor(Color("Brown"))
            }
            
            Button(action:{}){
                Text("ognimemo")
                .foregroundColor(Color("Brown"))
            }
            
            Button(action:{}){
                Text("전화걸기")
                .foregroundColor(Color("Brown"))
            }
            
        }
    }
}

struct DetailView: View {
    var address : String
    var body: some View {
        Main(address: self.address)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(address: "대구광역시 중구 동덕로6길 18-13")
    }
}

struct Main : View {
    var address : String
    @State var index = 0
    @State var show = true
    @State var modal = false
    @State var modalMenu:String = ""
    var body : some View{
        ZStack{
            VStack{
                appBar(address: self.address, index: self.$index,show: self.$show,
                       modal: self.$modal, modalMenu: self.$modalMenu)
                
                ZStack{
                    
                    CafeInfo().opacity(self.index == 0 ? 1 : 0)
                    
                    CafeReview(show: self.$show).opacity(self.index == 1 ? 1 : 0)
                    
                    CafeStory(shows: self.$show).opacity(self.index == 2 ? 1 : 0)
                }
            }
            
            ZStack{
                Button(action:{self.modal = false}){
                    Text("")
                        .frame(maxWidth:.infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
                }
                
                if(self.modalMenu == "cafeMenu"){
                    Menu()
                    .frame(maxWidth:.infinity, maxHeight: .infinity)
                }
                
                else if(self.modalMenu == "coupon"){
                    Coupon()
                }
                
                
            }
            .opacity(self.modal ? 1 : 0)
        }
    }
}

struct appBar : View {
    @State private var hashTags = ["#감성", "#연인", "#데이트", "#디저트"]
    var address : String
    var tabs = ["카페정보", "리뷰", "스토리"]
    @Binding var index : Int
    @Binding var show : Bool
    @Binding var modal : Bool
    @Binding var modalMenu : String
    @State private var Padding:CGFloat = 0
    var body : some View{
        
        VStack{
            
            if self.show{
                
                VStack{
                    Image("cafeImg")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     
                     HStack{
                         Text("오그니메모")
                         .font(.title)
                         .frame(maxWidth:.infinity, alignment: .leading)
                         .padding(.leading, 10.0)
                         
                         Button(action:{
                            self.modalMenu = "coupon"
                            self.modal.toggle()
                         }){
                             Text("10% 할인쿠폰")
                                 .font(.caption)
                                 .padding(.vertical, 4)
                                 .padding(.horizontal, 7)
                         }
                         .foregroundColor(.white)
                         .background(Color.red)
                         .cornerRadius(8)
                     }
                     
                     HStack{
                         ForEach(hashTags, id:\.self){
                             tag in Text("\(tag)")
                                 .foregroundColor(Color("Brown"))
                         }
                     }
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .padding(.leading, 10.0)
                     
                     Text("\(address)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10.0)
                     
                    DetailBtns(modal: self.$modal, modalMenu: self.$modalMenu)
                     .frame(maxWidth:.infinity, alignment: .trailing)
                }
                .frame(maxWidth:.infinity)
                .onAppear(){
                    self.Padding = 0
                }
                .onDisappear(){
                    self.Padding = 45
                }
            }
            
            HStack{
                ForEach(0...2, id:\.self){
                    index in
                    Button(action:{
                        self.index = index
                    }) {
                        VStack{
                            
                            Text("\(self.tabs[index])")
                                .foregroundColor(Color("Brown"))
                                .fontWeight(self.index == index ? .bold : .none)
                            
                            Capsule().fill(self.index == index ? Color("Brown") : Color.clear)
                            .frame(height: 2)
                        }
                    }
                }
            }
        }
//        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
    }
}

//struct Chats : View {
//
//    @Binding var show : Bool
//
//    var body : some View{
//
//        List(0...25,id: \.self){i in
//
//            if i == 0{
//
//                CellView()
//                .onAppear {
//
//                    withAnimation {
//
//                        self.show = true
//                    }
//
//                }
//                .onDisappear {
//
//                    withAnimation {
//
//                        self.show = false
//                    }
//                }
//            }
//            else{
//
//               CellView()
//            }
//
//        }
//    }
//}
//
//struct CellView : View {
//
//    var body : some View{
//
//        HStack{
//
//            Image("cafeImg")
//            .resizable()
//            .frame(width: 55, height: 55)
//
//            VStack(alignment: .leading, spacing: 10) {
//
//                Text("Elisa")
//
//                Text("Msg").font(.caption)
//            }
//        }
//        .padding(.vertical, 4)
//    }
//}

//
//struct Calls : View {
//
//    var body : some View{
//
//        GeometryReader{_ in
//
//            VStack{
//
//                Text("Calls")
//            }
//        }
//    }
//}

class Host : UIHostingController<ContentView>{

    override var preferredStatusBarStyle: UIStatusBarStyle{

        return .lightContent
    }
}
