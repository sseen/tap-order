//
//  TOLanguageCell.swift
//  TapOrder
//
//  Created by solo on 2022/3/3.
//

import SwiftUI

struct TOLanguageCell: View {
    var item:TOLanguage
    @Binding var seledItem:TOLanguage?
    @EnvironmentObject var userSetting: TOUserViewModel
    var body: some View {
        HStack(spacing:2) {
            VStack {
                Text(item.flagName)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                .padding([.trailing],0)
            }.frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.white)
            VStack(alignment:.leading) {
                Text(item.name.localizedString)
                    .foregroundColor(.black)
                .font(.system(size: 20))
                .frame(width:90, alignment: .leading)
            }.frame(minWidth: 90, maxWidth: .infinity)
                .background(Color.white)//blank can click
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.themeColor)
                    .font(.system(size: 20))
                    .opacity(item.name == seledItem?.name ? 1 : 0)
            }.frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.white)
        }
        //.frame(minWidth: 0, maxWidth: .infinity)
        .frame(width: 200, height: 30, alignment: .leading)
        //.background(.teal)
        .onTapGesture {
            self.seledItem = item
            userSetting.lang = "ja"
        }
    }
}

struct TOLanguageCell_Previews: PreviewProvider {
    static var previews: some View {
        TOLanguageCell(item: TOLanguage(name: "Japan", flagName: "🇯🇵"), seledItem: .constant(TOLanguage(name: "Japan", flagName: "🇯🇵")))
    }
}
