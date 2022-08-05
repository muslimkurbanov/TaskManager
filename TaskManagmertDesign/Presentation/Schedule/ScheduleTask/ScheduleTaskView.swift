//
//  ScheduleTaskView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 01.07.2022.
//

import SwiftUI

struct ScheduleTaskView: View {
    
    let task: TaskModel
    let date = Date.now
    
    var body: some View {
        
        HStack {
            Text(formattedTime(time: task.startTime))
                .foregroundColor(.gray)
                .font(.system(size: 18, weight: .semibold))
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(task.title)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(isCurrentTime() ? .white : .black)
                    Text("\(task.startTime) - \(task.endTime)")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(isCurrentTime() ? .hexStringToColor(hex: "#F8F6FF") : .gray)
                }
                Spacer()
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .padding()
            .background(isCurrentTime() ? Color.hexStringToColor(hex: "#4B7BE5") : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
    private func isCurrentTime() -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let taskTime = formatter.date(from: task.startTime) ?? Date.now
        formatter.dateFormat = "HH"
        let taskTimeInt = Int(formatter.string(from: taskTime))
        let currentTimeInt = Int(formatter.string(from: Date.now))
        
        return taskTimeInt == currentTimeInt
    }
    
    private func formattedTime(time: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let date = formatter.date(from: time)
        formatter.dateFormat = "HH"
        return formatter.string(from: date ?? Date())
    }
}

struct ScheduleTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleTaskView(task: TaskModel(title: "Test", description: "Test", startTime: "10:00", endTime: "11:00", date: "01.07.22", category: Category(title: "Test", description: "Test")))
            .previewLayout(.fixed(width: 500, height: 100))
    }
}
