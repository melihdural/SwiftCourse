//
//  KisiEkleViewModel.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import Foundation

class KisiEkleViewModel{
    var crud = CRUD();
    var mainPage = AnasayfaViewModel();
    
    func kaydet(new_ad: String, new_tel: String, completion: @escaping () -> Void){
        let newContact: Kisi =
        Kisi(kisi_ad: new_ad, kisi_tel: new_tel)
        
        crud.addContact(contact: newContact) {
            success, message in
            if success {
                print("Kayıt işlemi başarılı: \(message)")
                DispatchQueue.main.async {
                    completion();
                }
            }
        }
    }
}
