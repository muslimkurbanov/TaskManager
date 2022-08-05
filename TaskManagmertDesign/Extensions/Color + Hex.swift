//
//  UIColor + Hex.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 05.06.2022.
//

import SwiftUI

extension Color {
    
    static func hexStringToColor (hex:String, alpha: CGFloat = 1.0) -> Color {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return Color.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return Color(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            opacity: alpha
        )
    }
}
