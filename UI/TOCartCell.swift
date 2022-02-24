//
//  TOCartCell.swift
//  TapOrder
//
//  Created by solo on 2/22/22.
//

import SwiftUI

struct TOCartCell: View {
    var body: some View {
        HStack {
            Image("chicken")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 130, alignment: .center)
                .background(Color.normalGray)
                .cornerRadius(20)
            VStack(alignment:.leading,spacing: 15){
                HStack {
                    Text("Noodles")
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(Color.normalRed)
                            .font(.system(size: 25))
                    }

                }
                Text("20")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color.normalYellow)
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "minus.circle")
                            .foregroundColor(Color.themeColor)
                            .font(.system(size: 25))
                    }
                    Text("1")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.themeColor)
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(Color.themeColor)
                            .font(.system(size: 25))
                    }
                }
            }
        }
    }
}

struct TOCartCell_Previews: PreviewProvider {
    static var previews: some View {
        TOCartCell()
    }
}
