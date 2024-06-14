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
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListImageCorouselView()
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
                        .padding(32)
                }
            }
            
            
            VStack(alignment: .leading, spacing: 8){
                Text("Miami Villa")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                        
                        Text("4.86")
                        
                        Text(" - ")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Divider()
            
            //host info view
            HStack{
                VStack(alignment: .leading){
                    Text("Entire villa hosted by Melih Dural")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2){
                        Text("4 guests - ")
                        Text("4 bedrooms - ")
                        Text("4 beds - ")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                
                Image("host")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            //listing features
            VStack(alignment: .leading, spacing: 16){
                ForEach(0 ..< 2){ feature in
                    HStack(spacing: 12){
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading){
                            Text("superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Experienced host with great reviews")
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
                        ForEach(1 ..< 5){ bedroom in
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
                
                ForEach(0 ..< 3){ feature in
                    HStack(spacing: 12){
                        Image(systemName: "wifi")
                            .frame(width: 32, height: 32)
                        
                        Text("Wifi")
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
                
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .padding(.bottom, 32)
        .ignoresSafeArea()
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("$500")
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
    ListingDetailView()
}
