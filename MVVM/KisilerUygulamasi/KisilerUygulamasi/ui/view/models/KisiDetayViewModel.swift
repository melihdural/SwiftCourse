//
//  KisiDetayViewModel.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import Foundation

class KisiDetayViewModel {
    var crud = CRUD();
    var mainPage = AnasayfaViewModel();
    
    func guncelle(id: Int, new_ad: String, new_tel: String, completion: @escaping () -> Void){
        let updatedContact: Kisi =
        Kisi(id: id, kisi_ad: new_ad, kisi_tel: new_tel);
        
        crud.updateContact(contact: updatedContact) {
            success, message in
            if success {
                print("Güncelleme işlemi başarılı: \(message)")
                DispatchQueue.main.async {
                    completion();
                }
            }
        }
    }
}
