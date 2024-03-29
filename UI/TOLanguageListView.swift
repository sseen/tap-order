//
//  TOLanguageListView.swift
//  TapOrder
//
//  Created by solo on 2022/3/3.
//

import SwiftUI

struct TOLanguage:Identifiable {
    var id = UUID()
    let name:String
    let flagName:String
}

struct TOLanguageListView: View {
    let rows:[TOLanguage] = [TOLanguage(name: "Japan", flagName: "🇯🇵"),
                                                TOLanguage(name: "En", flagName: "🇺🇸")]
    @Binding var isSwitch:Bool
    @Binding var seledLan:TOLanguage?
    @Binding var lanDidchange:Bool
    var body: some View {
        //ScrollView(.vertical, showsIndicators: false) {
        
        //之前这里做的背景但是没有和动效分离
        //VStack {
            VStack {
                Text("Switching Language")
                    .font(.system(size: 17))
                    .foregroundColor(.themeColor)
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 20))
                List {
                    ForEach(rows) { one in
                        TOLanguageCell(item: one, seledItem: $seledLan, lanDidchange: $lanDidchange)
                            .listRowSeparator(.hidden)
                            .padding([.leading, .trailing])
                    }
                }
                .listStyle(.plain)
                .background(.white)
                .padding()
                Button(action: {
                    //withAnimation(.spring()) {
                        self.isSwitch = !self.isSwitch
                    //}
                }) {
                    Text("OK".localizedString)
                        .frame(minWidth: 220)
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.red, lineWidth: 0)
                        )
                }
                .frame(width:169,height:48)
                .background(Color.themeColor.opacity(0.85)) // If you have this
                .cornerRadius(25)
                .padding()
            }
            //.padding([.leading,.trailing], 20)
            .background(.white)
            .frame(width:.SCREENWIDTH-100, height: 350)
            .cornerRadius(40)
        }
//        .padding()
//        .frame(maxWidth:.infinity, maxHeight: .infinity)
//        .ignoresSafeArea(.all)
//        .background(.ultraThinMaterial)
//    }
}

struct TOLanguageListView_Previews: PreviewProvider {
    static var previews: some View {
        TOLanguageListView(isSwitch: .constant(false), seledLan: .constant(
            TOLanguage(name: "Japan", flagName: "🇯🇵")
        ), lanDidchange: .constant(false))
    }
}
