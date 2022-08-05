//
//  ContentView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 05.06.2022.
//

import SwiftUI
import SlideOverCard

// MARK: - Content view

struct HomeView: View {
    
    @State private var taskTextFieldText = ""
    @State var categories: [Category] = MockStore.categories
    
    @ObservedObject var taskSettings: TaskSettings
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    // Nav bar
                    HStack {
                        Button {
                            
                        } label: {
                            Image("icMenu")
                        }
                        .padding()

                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "person").foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(8)
                        }
                        .padding(.trailing, 16)
                    }
                    
                    ScrollView {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Привет, Муслим")
                                    .font(.system(.title))
                                    .fontWeight(.bold)
                                    .foregroundColor(.hexStringToColor(hex: "#363942"))
                                Text(Date.now, format: .dateTime.month()
                                        .day()
                                        .year()
                                        .locale(.init(identifier: "ru_RU")))
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading)
                            Spacer()
                        }
                        
                        // Search task text field
                        HStack {
                            TextField("Найти задачу", text: $taskTextFieldText)
                            Image("icSearch")
                        }
                        .padding()
                        .background(Color.hexStringToColor(hex: "#F5F5F5"))
                        .cornerRadius(16)
                        .padding(.horizontal)
                        
                        // MARK: - Категории
                        
                        CategoriesView(categories: $categories)
                        
                        // MARK: - Задачи
                        if taskSettings.tasks.count != 0 {
                            TasksView(taskSettings: taskSettings)
                        } else {
                            HStack {
                                Text("Задач нет")
                                    .foregroundColor(.hexStringToColor(hex: "#363942"))
                                    .fontWeight(.semibold)
                                    .font(.system(.title2))
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
            }
//            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

// MARK: - CategoriesView

struct CategoriesView: View {
    
    @Binding var categories: [Category]
    
    var rows: [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack {
            Text("Категории")
                .foregroundColor(.hexStringToColor(hex: "#363942"))
                .fontWeight(.semibold)
                .font(.system(.title2))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Показать все")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(categories) { category in
                        CategoryView(category: category)
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

// MARK: - TasksView

struct TasksView: View {
    
    @ObservedObject var taskSettings: TaskSettings
    
    var columns: [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Задачи")
                    .foregroundColor(.hexStringToColor(hex: "#363942"))
                    .fontWeight(.semibold)
                    .font(.system(.title2))
                Text(String(taskSettings.tasks.count))
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
                    .font(.system(.title2))
                
                Spacer()
                
                NavigationLink {
                    AllTasksView(taskSettings: taskSettings)
                } label: {
                    Text("Показать все")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .padding()
            LazyVGrid(columns: columns, spacing: 24) {
                
                ForEach(shortTasks(4)) { task in
                    ZStack {
                        TaskView(task: task)
                            .frame(height: 150)
                            .padding(.horizontal)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button("Удалить") {
                                    
                                }
                            }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    private func shortTasks(_ by: Int) -> [TaskModel] {
        var shortTasks: [TaskModel] = []
        taskSettings.tasks.enumerated().forEach {
            if $0 < by {
                shortTasks.append($1)
            }
        }
        return shortTasks
    }
}

// MARK: - MockStore

struct MockStore {
    static var categories = [
        Category(title: "iOS разработка", description: "12 проектов"),
        Category(title: "Web разработка", description: "2 проекта"),
        Category(title: "Figma", description: "5 проектов")
    ]
}

// MARK: - ContentView_Previews

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(taskSettings: TaskSettings())
    }
}
