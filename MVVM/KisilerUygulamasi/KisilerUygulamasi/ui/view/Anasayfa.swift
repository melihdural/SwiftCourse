//
//  ContentView.swift
//  KisilerUygulamasi
//
//  Created by Melih Dural on 10.05.2024.
//

import SwiftUI

struct Anasayfa: View {
    @ObservedObject var viewModel = AnasayfaViewModel();
    @State private var aramaText = "";
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.kisiler){ kisi in
                    NavigationLink(destination: KisiDetay(kisi: kisi)){
                        KisiItem(kisi: kisi)
                    }
                }.onDelete(perform: viewModel.delete)
            }.navigationTitle("Kişiler")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: KisiEkle()){
                            Image(systemName: "plus")
                        }
                    }
                }.onAppear{
                    viewModel.fetchKisiler();
                }
        }
        .searchable(text: $aramaText, prompt: "Ara")
        .onChange(of: aramaText) { s in
            viewModel.search(searchText: s)
        }
    }
}



#Preview {
    Anasayfa()
}
