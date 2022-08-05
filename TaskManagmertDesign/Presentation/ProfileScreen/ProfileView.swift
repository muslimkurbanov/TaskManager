//
//  ProfileView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 20.06.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var profileInfo: [ProfileInfoModel] = [
        ProfileInfoModel(image: "icLocation", title: "Локация", description: "Абдулхакима Исмаилова 35"),
        ProfileInfoModel(image: "icTimeMint", title: "Местное время", description: Date.now.formatted()),
        ProfileInfoModel(image: "icMail", title: "Почта", description: "muslim.kurbanov.20@mail.ru"),
        ProfileInfoModel(image: "icPhone", title: "Номер телефона", description: "+7 (989) 863 73-81")
    ]
    
    var body: some View {
//        NavigationView {
            
            ScrollView {
                Text("Профиль")
                    .font(.system(size: 20, weight: .medium))
                    .offset(y: 5)
                
                HStack(alignment: .center, spacing: 40) {
                    
                    VStack {
                        Text("20")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        Text("Проектов")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                    }
                    .frame(width: 100)

                    Image("icUserProfileImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    VStack {
                        Text("10")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        Text("Проектов завершено")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                    }
                    .frame(width: 100)

                }
                .padding()
                
                Text("Муслим Курбанов")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.hexStringToColor(hex: "#2f2f2f"))
                Text("iOS Разработчик")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
                
                HStack(spacing: 16) {
                    
                    Button {
                        // TODO: - Action for editProfile
                    } label: {
                        Text("Редактировать")
                            .foregroundColor(.white)
                            .padding()
                            .frame(height: 40)
                            .background(Color.hexStringToColor(hex: "#4B7BE5"))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    Button {
                        // TODO: - Action for adding person
                    } label: {
                        Image("icPersonAdd")
                            .padding()
                            .frame(width: 40, height: 40)
                            .background(Color.hexStringToColor(hex: "F8F6FF"))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    
                }
                .padding(.top, 22)
                
                
                LazyVGrid(columns: [GridItem()], spacing: 24) {
                    ForEach(profileInfo) {
                        ProfileInfoView(image: $0.image, title: $0.title, description: $0.description)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
//            .navigationBarHidden(true)
//        }
    }
}

struct ProfileInfoModel: Identifiable {
    var id = UUID()
    let image: String
    let title: String
    let description: String
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
