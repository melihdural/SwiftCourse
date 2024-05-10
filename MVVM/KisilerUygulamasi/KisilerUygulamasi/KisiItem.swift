//
//  KisiItem.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import SwiftUI

struct KisiItem: View {
    var kisi = Kisi();
    
    var body: some View {
        VStack(alignment: .leading){
            Text(kisi.kisi_ad!)
                .font(.system(size: 16))
            Text(kisi.kisi_tel!)
                .font(.system(size: 14))
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    KisiItem()
}
