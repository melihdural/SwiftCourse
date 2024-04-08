//
//  YemekTarifSayfasi.swift
//  Udemy
//
//  Created by Melih Dural on 8.04.2024.
//

import SwiftUI

struct YemekTarifSayfasi: View {
    let tarif = "Kıymayla hazırlanan Karnıyarık yerine daha hafif ve etsiz bir yemek hazırlamak istiyorsanız İmam Bayıldı tarifi tam size göre. Soğan, sarımsak ve bol domatesten oluşan bu tarifin yanına pirinç pilavı ya da bulgur pilavı yapabilir yanında cacıkla menünüzü tamamlayabilirsiniz. Patlıcanlar hazırsa hemen yapılışına geçelim. Şimdiden afiyet olsun!"
    
    var body: some View {
        GeometryReader{ geo in
            let pageWidth = geo.size.width
            let pageHeight = geo.size.height
            
            VStack {
                Image("yemekResim")
                    .resizable()
                    .frame(width: pageWidth, height: pageHeight / 3)
                
                VStack(alignment: .leading){
                    Text("Imam Bayildi")
                        .font(.system (size: 30))
                        .foregroundStyle(.red)
                        .padding(.leading)
                    HStack{
                        Text("Fırında")
                            .padding(.leading)
                        Spacer()
                        Text("1 Kasım")
                            .padding(.trailing)
                    }
                }
                
                Spacer()
                
                Text(tarif)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 50)
                
                Spacer()
                
                HStack(spacing: 0){
                    Button("Beğen") {
                        
                    }
                    .foregroundColor(.black)
                    .frame(width: pageWidth / 2, height: pageHeight / 20)
                    .background(.yellow)
                    Button("Yorum Yap") {
                        
                    }
                    .foregroundColor(.black)
                    .frame(width: pageWidth / 2, height: pageHeight / 20)
                    .background(.orange)
                }
            }
            
        }
    }
}

#Preview {
    YemekTarifSayfasi()
}
