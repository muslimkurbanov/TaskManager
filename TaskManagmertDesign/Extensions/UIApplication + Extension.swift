//
//  UIApplication + Extension.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 26.06.2022.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
