//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import Foundation

class AnasayfaViewModel : ObservableObject{
    @Published var kisiler = [Kisi]();
    
    let defaultKisiler = [
        Kisi(id: 1, kisi_ad: "Ali", kisi_tel: "1111"),
        Kisi(id: 2, kisi_ad: "Veli", kisi_tel: "2222"),
        Kisi(id: 3, kisi_ad: "Ahmet", kisi_tel: "3333")
    ]
    
    func fetchKisiler(){
        kisiler = defaultKisiler;
    }
    
    func search(searchText: String){
        if searchText.isEmpty{
            kisiler = defaultKisiler;
        }else {
            kisiler = defaultKisiler.filter { kisi in
                kisi.kisi_ad!.lowercased()
                    .contains(searchText.lowercased())
            }
        }
    }
    
    func delete(at offset: IndexSet) {
        if kisiler.count > 0 {
            let kisi = kisiler[offset.first!];
            kisiler.remove(at: offset.first!)
        }
    }
}
