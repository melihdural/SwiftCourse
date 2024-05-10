//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import SwiftUI

struct KisiDetay: View {
    @State private var updated_ad = "";
    @State private var updated_tel = "";
    
    var kisi = Kisi();
    
    var body: some View {
        VStack(spacing: 100) {
            TextField("Kişi Ad", text: $updated_ad)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("Kişi Tel", text: $updated_tel)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("GÜCELLE"){
            
            }
            .onAppear(){
                updated_ad = kisi.kisi_ad!;
                updated_tel = kisi.kisi_tel!;
            }
        }.navigationTitle("Kişiyi Güncelle")
    }
}

#Preview {
    KisiDetay()
}
