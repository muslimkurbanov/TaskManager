//
//  AddTaskView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 25.06.2022.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var taskTitle = ""
    @State private var taskDate = Date.now
    @State private var taskStartTime = Date.now
    @State private var taskEndTime = Calendar.current.date(byAdding: .hour, value: 1, to: Date.now) ?? Date.now
    @State private var taskDescription = "Описание задачи"
    @State private var taskCategory = ""
    
    @State private var showCategories = false
    @State private var addedCategories = [String()]
    
    @State var categories: [TaskCategoryModel] = [
        TaskCategoryModel(taskName: "Figma"),
        TaskCategoryModel(taskName: "UI Design"),
        TaskCategoryModel(taskName: "iOS Development"),
        TaskCategoryModel(taskName: "Web development"),
        TaskCategoryModel(taskName: "Design")]
    
    @ObservedObject var taskSettings: TaskSettings
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 32), spacing: 0),
        GridItem(.flexible(minimum: 32), spacing: 0),
        GridItem(.flexible(minimum: 32), spacing: 0)
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                //            HStack {
                //                Text("Новая задача")
                //                    .font(.title)
                //                    .fontWeight(.bold)
                //                    .foregroundColor(.hexStringToColor(hex: "#363942"))
                //                    .padding()
                //                Spacer()
                //            }
                
                VStack {
                    HStack {
                        Text("Название")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        TextField("Название задачи", text: $taskTitle)
                            .padding()
                    }
                    .frame(height: 50)
                    .background(Color.hexStringToColor(hex: "#F5F5F5"))
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                
                VStack {
                    HStack {
                        Text("Дата")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        DatePicker("Дата задачи", selection: $taskDate, displayedComponents: .date)
                            .padding()
                            .foregroundColor(Color(red: 0.753, green: /*@START_MENU_TOKEN@*/0.753/*@END_MENU_TOKEN@*/, blue: 0.757))
                    }
                    .frame(height: 50)
                    .background(Color.hexStringToColor(hex: "#F5F5F5"))
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Дата начала")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        HStack {
                            DatePicker("Время", selection: $taskStartTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        .cornerRadius(8)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Дата конца")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        HStack {
                            DatePicker("Время", selection: $taskEndTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        .cornerRadius(8)
                    }
                    Spacer(minLength: 140)
                }
                .padding()
                
                VStack {
                    HStack {
                        Text("Описание")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        Spacer()
                    }
                    
                    TextEditor(text: $taskDescription)
                        .font(.system(size: 16, weight: .medium))
                        .offset(x: -5)
                        .toolbar{
                            ToolbarItem(placement: .keyboard) {
                                Spacer()
                            }
                            ToolbarItem(placement: .keyboard) {
                                Button("Готово") {
                                    endEditing()
                                }
                            }
                            
                        }
                }
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Text("Добавить категорию")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        Spacer()
                    }
                    
                    HStack {
                        TextField("Категория", text: $taskCategory)
                            .padding()
                        Button {
                            showCategories = true
                        } label: {
                            Image(systemName: "plus")
                                .tint(.white)
                                .frame(width: 30, height: 30)
                                .background(Color.hexStringToColor(hex: "#D9D9D9"))
                                .clipShape(Circle())
                                .padding()
                        }
                        
                    }
                    .frame(height: 50)
                    .background(Color.hexStringToColor(hex: "#F5F5F5"))
                    .cornerRadius(8)
                    
                    if showCategories {
                        VStack {
                            HStack {
                                CategoryButtonView(taskCategory: $taskCategory, text: "Figma")
                                CategoryButtonView(taskCategory: $taskCategory, text: "iOS")
                                CategoryButtonView(taskCategory: $taskCategory, text: "Web Developer")
                            }
                            
                            HStack {
                                CategoryButtonView(taskCategory: $taskCategory, text: "Web Design")
                                CategoryButtonView(taskCategory: $taskCategory, text: "UI/UX")
                                CategoryButtonView(taskCategory: $taskCategory, text: "Figma")
                            }
                            HStack {
                                CategoryButtonView(taskCategory: $taskCategory, text: "Web Design")
                                CategoryButtonView(taskCategory: $taskCategory, text: "COVID")
                                CategoryButtonView(taskCategory: $taskCategory, text: "UI/UX Designer")
                            }
                        }
                        .padding()
                        .background(Color.hexStringToColor(hex: "#F5F5F5"))
                        .cornerRadius(16)
                        .padding(.top)
                    }
                }
                .animation(.default, value: showCategories)

                .padding()
                
                Button {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "HH:mm"
                    
                    self.taskSettings.addTask(task: TaskModel(title: taskTitle, description: taskDescription, startTime: dateFormatter.string(from: taskStartTime), endTime: dateFormatter.string(from: taskEndTime)))
                    
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Добавить задачу")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .background((taskTitle.isEmpty || taskDescription.isEmpty) ? .gray : Color.hexStringToColor(hex: "#4B7BE5"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                }
                .disabled(taskTitle.isEmpty || taskDescription.isEmpty)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Отмена") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Новая задача")
        }
    }
    
    private func endEditing() {
           UIApplication.shared.endEditing()
    }
}

struct CategoryButtonView: View {
    
    @Binding var taskCategory: String
    var text: String
    
    var body: some View {
        Button {
            taskCategory = text
        } label: {
            
            Text(text)
                .foregroundColor(.hexStringToColor(hex: "#764AF1"))
                .font(.system(size: 12))
                .padding()
                .frame(height: 32)
                .background(Color.hexStringToColor(hex: "#764AF1").opacity(0.10))
                .cornerRadius(8)
        }
    }
}

struct TaskCategoryModel: Identifiable {
    let id = UUID()
    let taskName: String
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskSettings: TaskSettings())
    }
}
