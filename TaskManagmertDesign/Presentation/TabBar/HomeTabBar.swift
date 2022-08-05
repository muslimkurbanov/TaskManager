//
//  HomeTabBar.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 05.06.2022.
//

import SwiftUI

struct HomeTabBar: View {
    
    @State private var selected = 0
    @State private var showAddTask = false
    @StateObject var taskSettings = TaskSettings()
    
    @State var timeRemaining = 2
    @State var rotation = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var selectedColor = Color.hexStringToColor(hex: "#3270FA")
    private var unselectedColor = Color.hexStringToColor(hex: "#4B7BE5").opacity(0.4)
    
    var body: some View {
        
            VStack {
                
                switch selected {
                case 0:
                    HomeView(taskSettings: taskSettings)
                case 1:
                    ScheduleView(taskSettings: taskSettings)
                case 2:
                    VStack {
                        Spacer()
                        Text("Hello")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                case 3:
                    ProfileView()
                case 4:
                    EmptyView()
                default:
                    EmptyView()
                }
                
                Spacer()
                
                ZStack {
                    
                    HStack {
                        Button {
                            self.selected = 0
                        } label: {
                            Image("icHome")
                                .renderingMode(.template)
                        }.foregroundColor(self.selected == 0 ? selectedColor : unselectedColor)
                        
                        Spacer(minLength: 12)
                        
                        Button {
                            self.selected = 1
                        } label: {
                            Image("icCalendar")
                                .renderingMode(.template)
                        }.foregroundColor(self.selected == 1 ? selectedColor : unselectedColor)
                        
                        Spacer().frame(width: 120)
                        
                        Button {
                            self.selected = 2
                        } label: {
                            Image("icNotebook")
                                .renderingMode(.template)
                        }.foregroundColor(self.selected == 2 ? selectedColor : unselectedColor)
                        
                        Spacer(minLength: 12)
                        
                        Button {
                            self.selected = 3
                        } label: {
                            Image("icPerson")
                                .renderingMode(.template)
                        }.foregroundColor(self.selected == 3 ? selectedColor : unselectedColor)
                        
                    }
                    .padding()
                    .padding(.horizontal, 22)
                    
                    
                    Button {
                        showAddTask.toggle()
                    } label: {
                        Image("icPlus")
                            .renderingMode(.original)
                            .padding(18)
//                            .rotationEffect(timeRemaining == 0 ? .degrees(-90) : .degrees(90))
                            .rotationEffect(.degrees(rotation))
                            .animation(.easeInOut, value: timeRemaining)
                            .onReceive(timer) { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                } else {
                                    rotation += 180
                                    timeRemaining = 1
                                }
                            }
                    }
                    .background(LinearGradient(colors: [Color.hexStringToColor(hex: "0093E9"), .hexStringToColor(hex: "80D0C7")], startPoint: .leading, endPoint: .trailing))
                    .clipShape(Circle())
                    .offset(y: -32)
                    .shadow(radius: 32)
                    .sheet(isPresented: $showAddTask) {
                        AddTaskView(taskSettings: taskSettings)
                    }
                }
                .frame(height: 30)
            }
    }
}

struct HomeTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBar()
    }
}
