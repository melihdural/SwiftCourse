//
//  KisiEkle.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import SwiftUI

struct KisiEkle: View {
    @State private var insert_ad = "";
    @State private var insert_tel = "";
    
    var kisiler = [Kisi]();
    
    func kaydet(new_ad: String, new_tel: String){
        let new_kisi = Kisi(
            id: (kisiler.count - 1),
            kisi_ad: new_ad,
            kisi_tel: new_tel)
    }
    
    var body: some View {
        VStack(spacing: 100) {
            TextField("Kişi Ad", text: $insert_ad)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("Kişi Tel", text: $insert_tel)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("KAYDET"){
                kaydet(new_ad: insert_ad, new_tel: insert_tel);
            }
        }.navigationTitle("Kişi Kaydet")
    }
}


#Preview {
    KisiEkle()
}
