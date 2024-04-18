//
//  TabViewMain.swift
//  Udemy
//
//  Created by Melih Dural on 17.04.2024.
//

import SwiftUI

struct TabViewMain: View {
    var body: some View {
        NavigationStack{
            TabView{
                IlhamVerSayfa().padding(.bottom).tabItem {
                    Label("Ilham Ver", systemImage: "bubble")
                }
                YemekTarifSayfasi().padding(.bottom).tabItem {
                    Label("Yemek Tarif", systemImage: "fork.knife.circle.fill")
                }
                LogInPage().padding(.bottom).tabItem {
                    Label("Login", systemImage: "person.crop.circle.fill")
                }
            }.navigationTitle("Udemy Eğitim")
                .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TabViewMain()
}
