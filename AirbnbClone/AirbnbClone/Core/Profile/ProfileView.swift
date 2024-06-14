//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 14.06.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32){
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
                }
                
                Button(){
                    
                }label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                HStack{
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
            }
            
            VStack(spacing: 16){
                ProfileOptionRowView(title: "Settings", imageName: "gear")
                ProfileOptionRowView(title: "Accesibility", imageName: "figure.wave")
                ProfileOptionRowView(title: "Visit the Help Center", imageName: "questionmark.circle")
            }.padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
