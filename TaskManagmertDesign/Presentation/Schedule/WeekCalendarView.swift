//
//  WeekCalendarView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 03.07.2022.
//

import SwiftUI

struct WeekCalendarView: View {
    
    var body: some View {
        HStack {
            ForEach(fetchCurrentWeek(), id: \.self) { day in
                Spacer()
                Text(formattedDate(date: day))
                    .font(.system(size: 24, weight: .semibold, design: .default))
                Spacer()
            }
        }
        .padding()
    }
    
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        
        return formatter.string(from: date)
    }
    
    private func fetchCurrentWeek() -> [Date] {
        
        var currentWeek: [Date] = []
        
        let today = Date.now
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else { return [] }
        
        (1...7).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekDay)
            }
        }
        
        return currentWeek
    }
}

struct WeekCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        WeekCalendarView()
    }
}
