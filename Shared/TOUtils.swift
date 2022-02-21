//
//  TOUtils.swift
//  TapOrder
//
//  Created by solo on 2/21/22.
//

import UIKit
import SwiftUI

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension Font {
    static var  toOrderFont: Font {
        return .system(size: 20, weight: .bold)
    }
}

extension Color {
    static var themeColor: Color {
        return Color(uiColor: UIColor(rgb: 0x6644AB))
    }
    static var normalGray: Color {
        return Color(uiColor: UIColor(rgb: 0xeeeeee))
    }
    static var normalGreen: Color {
        return Color(uiColor: UIColor(rgb: 0x18794B))
    }
}

extension CGFloat {
    static var SCREENWIDTH: CGFloat {
        return UIScreen.main.bounds.width
    }
    static var TOMenuCardWidth: CGFloat {
        return ( SCREENWIDTH - 40 * 3 ) * 0.5
    }
}
    