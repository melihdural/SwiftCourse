//
//  IlhamVerSayfa.swift
//  Udemy
//
//  Created by Melih Dural on 8.04.2024.
//

import SwiftUI

struct IlhamVerSayfa: View {
    let speechs: [String] = [
        "Kaliteli bir iş yapmanın tek yolu, sevdiğiniz bir işi yapmaktır. Yapmayı sevdiğiniz işi bulun ve asla pes etmeyin.",
        "İlerlemek için, işlerin nasıl yapıldığını sorgulamak gerekir. Asla kabul etmeyin, sadece çünkü herkesin kabul ettiği bir şey var diye.",
        "Başkalarının düşünceleriyle yaşamak, diğer insanların sonuçlarını yaşamaktır. Kendi iç sesinizi dinleyin ve kalbinizin yolunu izleyin.",
        "Yapacaklarınızı sevin ve tutkuyla yapın. Sadece tutkulu olanlar, dünyayı değiştirebilir.",
        "Başarılı olmanın sırrı, başkalarının düşüncelerini takip etmek değil, kendi iç sesinizi ve yaratıcılığınızı takip etmektir.",
    ]
    
    @State private var randomSpeech: String?
    
    var body: some View {
        VStack(spacing: 100){
            VStack{
                Image("stevejobs")
                Text("SteveJobs")
                    .font(.system(size: 22).bold())
                    .foregroundColor(Color.red)
            }
            
            if let s = randomSpeech{
                Text(s)
                    .multilineTextAlignment(.center)
            }
            
            Button("ILHAM VER"){
                while(randomSpeech != speechs.randomElement()){
                    randomSpeech = speechs.randomElement()
                }
            }
            .foregroundColor(.white)
            .padding()
            .background(.red)
            .cornerRadius(8)
        }
    }
}

#Preview {
    IlhamVerSayfa()
}
