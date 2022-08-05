//
//  ScheduleView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 28.06.2022.
//

import SwiftUI

struct ScheduleView: View {
    
    @ObservedObject var taskSettings: TaskSettings
    
    var body: some View {
        
        NavigationView {
            VStack {
                WeekCalendarView()
                
                GradientLineView()
                    .frame(maxWidth: 234)
                    .frame(height: 2)
                ScrollView {
                    
                    ForEach(filteredTasks()) { task in
                        ScheduleTaskView(task: task)
                            .shadow(color: .hexStringToColor(hex: "000000", alpha: 0.08), radius: 1, x: 3, y: 3)
                            .padding(.horizontal)
                            .padding(.top)
                    }
                }
            }
            .navigationTitle("Расписание")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func filteredTasks() -> [TaskModel] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return taskSettings.tasks.sorted { a, b in
            
            let aDate = dateFormatter.date(from: a.startTime)
            let bDate = dateFormatter.date(from: b.startTime)
            
            return aDate?.compare(bDate ?? Date()) == .orderedAscending
        }
        
    }
}

struct GradientLineView: View {
    var startColor = Color.hexStringToColor(hex: "#4B7BE5", alpha: 0.0)
    var middleColor = Color.hexStringToColor(hex: "#4B7BE5", alpha: 1.0)
    var endColor = Color.hexStringToColor(hex: "#4B7BE5", alpha: 0.0)
    
    var body: some View {
        LinearGradient(colors: [startColor, middleColor, endColor], startPoint: .leading, endPoint: .trailing)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(taskSettings: TaskSettings())
    }
}
