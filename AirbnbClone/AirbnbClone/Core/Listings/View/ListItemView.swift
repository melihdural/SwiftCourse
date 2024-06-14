//
//  ListItemView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 12.06.2024.
//

import SwiftUI

struct ListItemView: View {
    var listing: Listing;
    
    var body: some View {
        VStack(spacing: 8){
            //images
            ListImageCorouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //listing details
            HStack(alignment: .top){
                //details
                VStack(alignment: .leading, spacing: 4){
                    Text("\(listing.city) - \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("12 mi away")
                        .foregroundColor(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 4 ) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("night")
                            .foregroundColor(.black)
                    }
                    
                }
                
                Spacer()
                
                //ratings
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                    Text("\(listing.rating.formatted())")
                        .foregroundColor(.black)
                }
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListItemView(listing: DeveloperPreview.shared.listings[0])
}
