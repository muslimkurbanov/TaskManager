//
//  TaskModel.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 05.06.2022.
//

import SwiftUI

struct TaskModel: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    let startTime: String
    let endTime: String
//    let time: String
    var date: String? = ""
    var category: Category? = Category(title: "", description: "")
}
