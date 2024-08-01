//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 12.06.2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var camPositon : MapCameraPosition
    var listing: Listing;
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        self._camPositon = State(initialValue:. region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListImageCorouselView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                }
                label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical, 44)
                    
                }
            }
            
            
            VStack(alignment: .leading, spacing: 8){
                Text(listing.title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                        
                        Text(listing.rating.formatted())
                        
                        Text(" - ")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city) - \(listing.state)")
                }
                .font(.caption)
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Divider()
            
            //host info view
            HStack{
                VStack(alignment: .leading){
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2){
                        Text("\(listing.numberOfGuests) guests - ")
                        Text("\(listing.numberOfBedrooms) bedrooms - ")
                        Text("\(listing.numberOfBeds) beds - ")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            //listing features
            VStack(alignment: .leading, spacing: 16){
                ForEach(listing.features){ feature in
                    HStack(spacing: 12){
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            //bedrooms view
            VStack(alignment: .leading, spacing: 16){
                Text("When you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(1 ..< listing.numberOfBedrooms, id: \.self){ bedroom in
                            VStack(alignment: .leading, spacing: 4){
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            //amenities view
            VStack(alignment: .leading, spacing: 20){
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities){ feature in
                    HStack(spacing: 12){
                        Image(systemName: feature.imageName)
                            .frame(width: 32, height: 32)
                        
                        Text(feature.title)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 20){
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $camPositon)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 32)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        
                        Text("Nov 1 - 10")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button(){
                        
                    } label: {
                        Text("Reserve")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}
    
#Preview {
    ListingDetailView( listing: DeveloperPreview.shared.listings[0])
}
