//
//  DetailView.swift
//  odi
//
//  Created by taese0ng on 2020/08/07.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct Cafe_srl_info:Hashable{
    struct Menu:Hashable{
        var menu_type:String
        var menu_name:String
        var menu_price:String
    }
    var cafe_name:String
    var cafe_category:String
    var cafe_review_score_avg:Int?
    var cafe_review_count:Int?
    var cafe_address:String
    var cafe_coupon:String
    var cafe_sns_account:String?
    var cafe_phone:String?
    var cafe_oneline_intro:String?
    var cafe_week_workday:String
    var cafe_weekend_workday:String
    var cafe_closed_date:String?
    var cafe_intro:String
    var cafe_info:String
    var cafe_image_count:Int
    var menu:Array<Menu>
    var cafe_tag:Array<String>
    var is_like:String
    var is_coupon_use:String
}

struct DetailBtns: View{
    var info : Cafe_srl_info
    @Binding var modal:Bool
    @Binding var modalMenu:String
    
    var body: some View{
        HStack{
            Button(action:{
                withAnimation{
                    self.modalMenu = "cafeMenu"
                    self.modal.toggle()
                }
            }){
                Text("메뉴보기")
                    .font(.custom("menu", size: 15))
                .foregroundColor(Color("Brown"))
            }
            
            Button(action:{
                if let url = URL(string: "https://www.instagram.com") {
                    UIApplication.shared.open(url, options: [:])
                }
            }){
                HStack{
                    Image("instagram")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width:10, height: 10)
                        .foregroundColor(Color("Brown"))
                    
                    Text("ognimemo")
                    .font(.custom("sns", size: 15))
                    .foregroundColor(Color("Brown"))
                }
            }
            
            Button(action:{
                PhoneNumber(extractFrom: "+1-(800)-123-4567")?.makeACall()
                //https://stackoverflow.com/questions/40078370/how-to-make-phone-call-in-ios-10-using-swift
            }){
                HStack{
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width:10, height: 10)
                        .foregroundColor(Color("Brown"))
                    
                    Text("전화걸기")
                        .font(.custom("call", size: 15))
                    .foregroundColor(Color("Brown"))
                }
            }
            
        }
    }
}

struct DetailView: View {
    @State var modal = false
    @State var modalMenu:String = ""
    @State var cafe_srl_info:Cafe_srl_info = Cafe_srl_info(cafe_name: "", cafe_category: "", cafe_address: "", cafe_coupon: "", cafe_week_workday: "", cafe_weekend_workday: "", cafe_intro: "", cafe_info: "", cafe_image_count: 0, menu: [Cafe_srl_info.Menu](), cafe_tag: [String](), is_like: "", is_coupon_use: "")
    @EnvironmentObject var store:Store
    var cafe_srl:Int
    
    var body: some View {
        ZStack{
            Main(info: cafe_srl_info, modal:self.$modal, modalMenu:self.$modalMenu)
            
            if(self.modal){
                ZStack{
                    Button(action:{
                        self.modal.toggle()
                    }){
                        Text("")
                            .frame(maxWidth:.infinity, maxHeight: .infinity)
                            .background(Color.black.opacity(0.5))
                            .edgesIgnoringSafeArea(.top)
                    }
                    
                    switch modalMenu{
                    case "cafeMenu":Menu()
                    case "coupon":Coupon()
                    default:Coupon()
                    }
                }
            }
        }.onAppear(){
            //디테일 통신 해야함.
            CafeDetail_dispatch(cafe_srl_info:$cafe_srl_info).dispatch(store: store, srl: cafe_srl)
//            print("cafe_srl_info:\(cafe_srl_info)")
        }
    }
}

struct Main : View {
    var info :Cafe_srl_info
    @State private var isLike:Bool = false
    @State var index = 0
    @Binding var modal:Bool
    @Binding var modalMenu:String
    var screenHeight = UIScreen.main.bounds.size.height
    var screenWidth = UIScreen.main.bounds.size.width
    
    func shareURLButton() {
        let img = UIImage(named: "AppIcon")
        let avc = UIActivityViewController(
            activityItems: [img!],
            applicationActivities: nil)
    
        UIApplication.shared.windows.first?
            .rootViewController?.present(
            avc, animated: true, completion: nil)
    }
    
    var body : some View{
        ScrollView(.vertical, showsIndicators:false){
            ZStack{
                VStack{
                    appBar(info: self.info, index: self.$index,
                           modal: self.$modal, modalMenu: self.$modalMenu)
                    
                    switch self.index{
                        case (0):
                            CafeInfo()
                            .padding(.horizontal, 20)
                        case (1):
                            CafeReview(myReview: false)
                        case (2):
                            CafeStory()
                        default:
                            CafeInfo()
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing: HStack{
            Button(action:{self.shareURLButton()}){
                Image(systemName:"square.and.arrow.up")
                    .foregroundColor(Color.white)
            }
            
            Button(action:{
//                self.isLike.toggle()
            }){
                if(info.is_like == "Y"){
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color.white)
                }
                else{
                    Image(systemName: "heart")
                        .foregroundColor(Color.white)
                }
            }
            .padding(.leading, 20)
        })
    }
}

struct appBar : View {
//    @State private var hashTags = ["#감성", "#연인", "#데이트", "#디저트"]
    var info : Cafe_srl_info
    var tabs = ["카페정보", "리뷰", "스토리"]
    @Binding var index : Int
    @Binding var modal : Bool
    @Binding var modalMenu : String
    @State private var Padding:CGFloat = 0
    var screenWidth = UIScreen.main.bounds.size.width
    
    
    
    var body : some View{
        VStack{
            VStack{
                Image("cafeImg")
                 .resizable()
                .frame(height:300)
                
                HStack{
                    Text("\(info.cafe_name)")
                    .fontWeight(.bold)
                    .font(.title)
                    .frame(maxWidth:.infinity, alignment: .leading)
                     
                    Button(action:{
                        self.modalMenu = "coupon"
                        self.modal.toggle()
                    }){
                        Text("\(info.cafe_coupon) 할인쿠폰")
                            .font(.caption)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 7)
                    }
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                 
                HStack{
                    ForEach(info.cafe_tag, id:\.self){
                        tag in Text("#\(tag)")
                            .font(.custom("tag", size: 12))
                            .foregroundColor(Color("Brown"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                 
                Text("\(info.cafe_address)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
                 
                DetailBtns(info: self.info, modal: self.$modal, modalMenu: self.$modalMenu)
                 .frame(maxWidth:.infinity, alignment: .trailing)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
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


class DataDetector {

    private class func _find(all type: NSTextCheckingResult.CheckingType,
                             in string: String, iterationClosure: (String) -> Bool) {
        guard let detector = try? NSDataDetector(types: type.rawValue) else { return }
        let range = NSRange(string.startIndex ..< string.endIndex, in: string)
        let matches = detector.matches(in: string, options: [], range: range)
        loop: for match in matches {
            for i in 0 ..< match.numberOfRanges {
                let nsrange = match.range(at: i)
                let startIndex = string.index(string.startIndex, offsetBy: nsrange.lowerBound)
                let endIndex = string.index(string.startIndex, offsetBy: nsrange.upperBound)
                let range = startIndex..<endIndex
                guard iterationClosure(String(string[range])) else { break loop }
            }
        }
    }

    class func find(all type: NSTextCheckingResult.CheckingType, in string: String) -> [String] {
        var results = [String]()
        _find(all: type, in: string) {
            results.append($0)
            return true
        }
        return results
    }

    class func first(type: NSTextCheckingResult.CheckingType, in string: String) -> String? {
        var result: String?
        _find(all: type, in: string) {
            result = $0
            return false
        }
        return result
    }
}

// MARK: PhoneNumber

struct PhoneNumber {
    private(set) var number: String
    init?(extractFrom string: String) {
        guard let phoneNumber = PhoneNumber.first(in: string) else { return nil }
        self = phoneNumber
    }

    private init (string: String) { self.number = string }

    func makeACall() {
        guard let url = URL(string: "tel://\(number.onlyDigits())"),
            UIApplication.shared.canOpenURL(url) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    static func extractAll(from string: String) -> [PhoneNumber] {
        DataDetector.find(all: .phoneNumber, in: string)
            .compactMap {  PhoneNumber(string: $0) }
    }

    static func first(in string: String) -> PhoneNumber? {
        guard let phoneNumberString = DataDetector.first(type: .phoneNumber, in: string) else { return nil }
        return PhoneNumber(string: phoneNumberString)
    }
}

extension PhoneNumber: CustomStringConvertible { var description: String { number } }

// MARK: String extension

extension String {

    // MARK: Get remove all characters exept numbers

    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }

    var detectedPhoneNumbers: [PhoneNumber] { PhoneNumber.extractAll(from: self) }
    var detectedFirstPhoneNumber: PhoneNumber? { PhoneNumber.first(in: self) }
}


class Host : UIHostingController<ContentView>{

    override var preferredStatusBarStyle: UIStatusBarStyle{

        return .lightContent
    }
}
