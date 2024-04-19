//
//  GambleGamePage.swift
//  Udemy
//
//  Created by Melih Dural on 19.04.2024.
//

import SwiftUI

struct GambleGamePage: View {
    @State private var targetNumber = 0
    
    @State private var guessCount = 5
    @State private var helpText = ""
    @State private var userGuess = ""
    @State private var isGameEnd = false
    @State private var isUserWin = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 100) {
                Text("Kalan Tahmin Sayısı: \(guessCount)")
                    .font(.system(size: 36))
                    .foregroundColor(.red)
                    .bold()
                    .onAppear(){
                        guessCount = 5
                    }
                
                Text("Yardım: \(helpText)")
                    .bold()
                    .onTapGesture {
                        if targetNumber <= 5{
                            helpText = "Sayı <= 5"
                        }
                        else {
                            helpText = "Sayı >= 5"
                        }
                    }
                    
                
                TextField("Tahmin giriniz...", text: $userGuess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("TAHMİN ET"){
                    if (Int(userGuess)) == targetNumber {
                        isUserWin = true
                        isGameEnd = true
                    }
                    else {
                        guessCount -= 1
                        isUserWin = false
                        if guessCount <= 0 {
                            isGameEnd = true
                        }
                    }
                }
                .frame(width: 250, height: 50)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .navigationDestination(isPresented: $isGameEnd){
                GambleEndPage(isUserWin: $isUserWin)
            }
            .onAppear(){
                targetNumber = Int.random(in: 1...10)
            }
        }
    }
}

#Preview {
    GambleGamePage()
}
