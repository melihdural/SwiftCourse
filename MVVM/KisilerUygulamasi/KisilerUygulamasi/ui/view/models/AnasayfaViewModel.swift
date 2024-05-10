//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import Foundation

class AnasayfaViewModel : ObservableObject{
    @Published var kisiler = [Kisi]();
    @Published var kisilerMaster = [Kisi]();
    var crud = CRUD();
    
    func fetchKisiler(){
        crud.getContacts() {success,contacts,message in
            if success {
                print("Fetch işlemi başarılı: \(message)")
                DispatchQueue.main.async {
                    self.kisiler = contacts ?? [];
                    self.kisilerMaster = contacts ?? [];
                }
            } else {
                print("Fetch işlemi başarısız: \(message)")
            }
            
        }
    }
    
    func search(searchText: String){
        if searchText.isEmpty{
            kisiler = kisilerMaster;
        }else {
            kisiler = kisiler.filter { kisi in
                kisi.kisi_ad!.lowercased()
                    .contains(searchText.lowercased())
            }
        }
    }
    
    func delete(at offset: IndexSet) {
        offset.forEach { index in
            let contactId = self.kisiler[index].id;
            crud.deleteContact(contactId: contactId!) { success, message in
                if success {
                    print("Silme işlemi başarılı: \(message)")
                    DispatchQueue.main.async {
                        self.kisiler.remove(at: index)
                    }
                } else {
                    print("Silme işlemi başarısız: \(message)")
                }
            }
        }
    }
}
