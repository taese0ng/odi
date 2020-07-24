//
//  TopBar.swift
//  odi
//
//  Created by taese0ng on 2020/07/24.
//  Copyright © 2020 taese0ng. All rights reserved.
//

import SwiftUI

struct TopBar: View {
    var title:String
    
    var body: some View {
        HStack{
            Text(title).frame(maxWidth: .infinity, alignment: .leading).font(.title)
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar(title:"내주변")
    }
}
