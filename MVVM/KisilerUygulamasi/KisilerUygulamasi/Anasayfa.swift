//
//  ContentView.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import SwiftUI

struct Anasayfa: View {
    @State private var kisiler = [Kisi]();
    @State private var aramaText = "";
    
    let defaultKisiler = [
        Kisi(id: 1, kisi_ad: "Ali", kisi_tel: "1111"),
        Kisi(id: 2, kisi_ad: "Veli", kisi_tel: "2222"),
        Kisi(id: 3, kisi_ad: "Ahmet", kisi_tel: "3333")
    ]
    
    func sil(at offset: IndexSet) {
        if kisiler.count > 0 {
            let kisi = kisiler[offset.first!];
            kisiler.remove(at: offset.first!)
        }
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(kisiler){ kisi in
                    NavigationLink(destination: KisiDetay(kisi: kisi)){
                        KisiItem(kisi: kisi)
                    }
                }.onDelete(perform: sil)
            }.navigationTitle("Kişiler")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: KisiEkle()){
                            Image(systemName: "plus")
                        }
                    }
                }.onAppear{
                    kisiler = defaultKisiler;
                }
        }
        .searchable(text: $aramaText, prompt: "Ara")
        .onChange(of: aramaText) { s in
            if s.isEmpty{
                kisiler = defaultKisiler;
            }else {
                kisiler = defaultKisiler.filter { kisi in
                    kisi.kisi_ad!.lowercased()
                        .contains(s.lowercased())
                }
            }
        }
    }
}



#Preview {
    Anasayfa()
}
