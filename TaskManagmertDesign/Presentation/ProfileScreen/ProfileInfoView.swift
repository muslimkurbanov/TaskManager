//
//  ProfileInfoView.swift
//  TaskManagmertDesign
//
//  Created by Муслим Курбанов on 11.07.2022.
//

import SwiftUI

struct ProfileInfoView: View {
    
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 26) {
            Image(image)
                .padding()
                .frame(width: 36, height: 36)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.leading, 24)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                Text(description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(Color.hexStringToColor(hex: "F8F6FF"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView(image: "icPhone", title: "Номер", description: "+7 (989) 863 73-81")
    }
}
