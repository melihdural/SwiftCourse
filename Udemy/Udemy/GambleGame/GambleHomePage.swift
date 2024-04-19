//
//  GambleHomePage.swift
//  Udemy
//
//  Created by Melih Dural on 19.04.2024.
//

import SwiftUI

struct GambleHomePage: View {
    @State private var isGameReady = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 100) {
                Text("Tahmin Oyunu")
                    .font(.system(size: 36))
                    .bold()
                
                Image("zar")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Button("Oyuna Başla"){
                    isGameReady = true
                }
                .frame(width: 250, height: 50)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }.navigationDestination(isPresented: $isGameReady){
                GambleGamePage()
            }
        }
    }
}

#Preview {
    GambleHomePage()
}
