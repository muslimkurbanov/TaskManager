//
//  CategoryModel.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 05.06.2022.
//

import SwiftUI

struct Category: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
}
