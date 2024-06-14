//
//  ListImageCorouselView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 12.06.2024.
//

import SwiftUI

struct ListImageCorouselView: View {
    var listing: Listing
    
    var body: some View {
        TabView(){
            ForEach(listing.imageUrls, id: \.self){ image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
             
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListImageCorouselView(listing: DeveloperPreview.shared.listings[0])
}
