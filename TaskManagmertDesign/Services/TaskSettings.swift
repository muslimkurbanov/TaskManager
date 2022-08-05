//
//  TaskViewModel.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 27.06.2022.
//

import Foundation
import Combine

class TaskSettings: ObservableObject {
    
    @Published var tasks: [TaskModel] {
        didSet {
            let data = try? encoder.encode(tasks)
            UserDefaults.standard.set(data, forKey: "TASKS_KEY")
        }
    }
    
//    @Published var tasks: [TaskModel] = {
//
//        guard let tasksJSON = UserDefaults.standard.object(forKey: "TASKS_KEY") as? Data,
//              let tasks = try? JSONDecoder().decode([TaskModel].self, from: tasksJSON) else { return [] }
//        return tasks
//    }()
    
    private let defaults = UserDefaults.standard
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "TASKS_KEY"
    
    required init() {
        let tasksJSON = UserDefaults.standard.object(forKey: "TASKS_KEY") as? Data
        
        let tasks = try? JSONDecoder().decode([TaskModel].self, from: tasksJSON ?? Data())
        
        self.tasks = tasks ?? []
        
    }
    
    func addTask(task: TaskModel) {
        tasks.append(task)
        
        let data = try? encoder.encode(tasks)
        defaults.setValue(data, forKey: key)
    }
    
    func removeTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks.remove(at: index)
            
            let data = try? encoder.encode(tasks)
            defaults.setValue(data, forKey: key)
        }
    }
}
