//
//  GambleEndPage.swift
//  Udemy
//
//  Created by Melih Dural on 19.04.2024.
//

import SwiftUI

struct GambleEndPage: View {
    @Binding var isUserWin: Bool
    
    var body: some View {
        VStack(spacing: 100){
            if isUserWin {
                Text("Kazandınız")
                    .font(.system(size: 36))
                    .bold()
                
                Image("mutlu")
                    .resizable()
                    .frame(width: 200, height: 200)
            } else {
                Text("Kaybettiniz")
                    .font(.system(size: 36))
                    .bold()
            
                Image("uzgun")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
    }
}

struct GambleEndPage_Previews: PreviewProvider {
    @State static var isUserWin = true
    
    static var previews: some View {
        GambleEndPage(isUserWin: $isUserWin)
    }
}
