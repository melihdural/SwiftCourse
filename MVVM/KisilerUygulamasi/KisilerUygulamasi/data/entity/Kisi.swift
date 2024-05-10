//
//  Kisi.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import Foundation

class Kisi: Identifiable, Codable {
    var id: Int?
    var kisi_ad: String?
    var kisi_tel: String?
    
    init(){
        
    }
    
    init(kisi_ad: String?, kisi_tel: String?) {
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
    
    init(id: Int?, kisi_ad: String?, kisi_tel: String?) {
        self.id = id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
}
