//
//  LogInPage.swift
//  Udemy
//
//  Created by Melih Dural on 8.04.2024.
//

import SwiftUI

struct LogInPage: View {
    @State private var userName: String = "";
    @State private var userPassword: String = "";
    @State private var showPassword: Bool = false
    
    var body: some View {
        VStack(spacing: 50){
            Image("logo")
            
            VStack{
                TextField("Kullanıcı Adı", text: $userName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                HStack{
                    
                    if showPassword {
                        TextField("Şifre", text: $userPassword)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                    else {
                        SecureField("Şifre", text: $userPassword)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                    Button(action: {
                        showPassword = !showPassword
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                            .padding(.trailing, 10.0)
                            .foregroundColor(.red)
                    })
                }
            }
            
            Button("LOG IN"){
                
            }
            .foregroundColor(.white)
            .padding()
            .background(.red)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.indigo)
    }
}

#Preview {
    LogInPage()
}
