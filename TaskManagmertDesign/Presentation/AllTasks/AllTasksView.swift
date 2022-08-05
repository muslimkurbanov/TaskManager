//
//  AllTasksView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 25.06.2022.
//

import SwiftUI

struct AllTasksView: View {
    
    @ObservedObject var taskSettings: TaskSettings
    
    var body: some View {
        
        List(taskSettings.tasks) { task in
            TaskView(task: task)
                .buttonStyle(PlainButtonStyle())
                .listRowSeparator(.hidden)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button("Удалить") {
                        taskSettings.removeTask(task: task)
                    }
                    .tint(.red)
                }
        }
        .navigationTitle("Задачи")
        .listStyle(.plain)
        .animation(.default)
    }
}

//struct AllTasksView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllTasksView(tasks: [TaskModel(title: "", description: "", time: "")])
//    }
//}
