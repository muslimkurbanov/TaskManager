//
//  Int + Extension.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 28.06.2022.
//

import SwiftUI

extension Int {
    func times(_ f: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
    
    func times(_ f: @autoclosure () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
}
