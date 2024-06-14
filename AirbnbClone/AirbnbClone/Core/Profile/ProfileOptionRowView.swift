//
//  ProfileOptionRowView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 14.06.2024.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let title: String
    let imageName: String
    
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: imageName)
                .font(.title2)
                .foregroundStyle(.black)
            
            Text(title)
                .font(.title3)
                .foregroundStyle(.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.title2)
                .foregroundStyle(.black)
        }
        .padding(.horizontal)
        
        Divider()
    }
}

#Preview {
    ProfileOptionRowView(title: "Account", imageName: "person")
}
