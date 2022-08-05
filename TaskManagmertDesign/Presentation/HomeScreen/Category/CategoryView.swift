//
//  CategoryView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 05.06.2022.
//

import SwiftUI


// MARK: - CategoryView

struct CategoryView: View {
    
    let category: Category
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                Spacer()
                Text(category.title)
                    .foregroundColor(.hexStringToColor(hex: "#F8F6FF"))
                    .fontWeight(.medium)
                    .font(.headline)
                Text(category.description)
                    .foregroundColor(.hexStringToColor(hex: "#F8F6FF"))
                    .fontWeight(.medium)
                    .font(.subheadline)
                    .padding(.bottom)
            }
            .frame(width: 200, height: 90)
            .background(LinearGradient(colors: [.hexStringToColor(hex: "#0093E9"), .hexStringToColor(hex: "#80D0C7")], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(12, corners: [.topLeft, .topRight])
            
            VStack(alignment: .leading) {
                HStack {
                    Text("60%")
                        .foregroundColor(.hexStringToColor(hex: "#363942"))
                        .fontWeight(.medium)
                        .font(.headline)
                        .padding()
                    Spacer()
                }
                HStack {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: 150, height: 2)
                            .padding(.horizontal)
                            .foregroundColor(.hexStringToColor(hex: "#EBEBEB"))
                        Rectangle()
                            .frame(width: 100, height: 2)
                            .padding(.horizontal)
                            .foregroundStyle(LinearGradient(colors: [.hexStringToColor(hex: "#80D0C7"), .hexStringToColor(hex: "#0093E9")], startPoint: .leading, endPoint: .trailing))
                    }
//                    .frame(width: 150)
                    Circle()
                        .frame(width: 20, height: 20)
                        .offset(x: -15)
                        .foregroundStyle(LinearGradient(colors: [.hexStringToColor(hex: "#80D0C7"), .hexStringToColor(hex: "#0093E9")], startPoint: .leading, endPoint: .trailing))
                    
                }
                .offset(y: -20)
            }
            .frame(width: 200, height: 60)
            .background(.white)
            .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
        }
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 8)
        .padding(.bottom, 15)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(title: "iOS Разработка", description: "12 проектов"))
            .previewLayout(.fixed(width: 220, height: 200))
    }
}
