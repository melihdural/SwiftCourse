//
//  ListImageCorouselView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 12.06.2024.
//

import SwiftUI

struct ListImageCorouselView: View {
    let images = ["home1", "home2", "home3", "home4", "home5"]
    
    var body: some View {
        TabView(){
            ForEach(images, id: \.self){ image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
             
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListImageCorouselView()
}
