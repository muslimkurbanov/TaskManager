//
//  TaskView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 05.06.2022.
//

import SwiftUI

struct TaskView: View {
    
    let task: TaskModel
    
    var body: some View {
        
        ZStack {
            
            Color.white
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(task.title)
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                    Text(task.description)
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                        .font(.system(size: 12))
                }
                
                Divider()
                    .foregroundColor(.hexStringToColor(hex: "#BFBFBF"))
                    .padding(.bottom)
                
                HStack {
                    Image("icTime")
                    Text("\(task.startTime) - \(task.endTime)")
                        .foregroundColor(.hexStringToColor(hex: "#363942"))
                        .fontWeight(.regular)
                        .font(.system(size: 14))
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Прогресс")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .font(.system(size: 10))
                            .padding()
                    }
                    .background(Color.hexStringToColor(hex: "#4B7BE5"))
                    .frame(height: 26)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    
                }
            }
            .padding()
        }
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 3, y: 3)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: TaskModel(title: "Landing Page Agency Creative", description: "Web Desing", startTime: "10:00", endTime: "11:00"))
    }
}
