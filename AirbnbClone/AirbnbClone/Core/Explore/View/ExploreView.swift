//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 12.06.2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var isShowingFilter = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack{
            if isShowingFilter{
                DestinationSearchView(
                    show: $isShowingFilter,
                    viewModel: viewModel
                )
            }
            else{
                SearchFilterBarView(
                viewModel: viewModel)
                    .onTapGesture {
                        withAnimation(.snappy){
                            isShowingFilter.toggle()
                        }
                    }
                ScrollView{
                    LazyVStack(spacing: 32){
                        ForEach(viewModel.listings){ listing in
                            NavigationLink(value: listing){
                                ListItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding()
                    }
                    .navigationDestination(for: Listing.self){ listing in
                        ListingDetailView(listing: listing)
                            .navigationBarBackButtonHidden()
                    }
                }
            }
        }
    }
}
#Preview {
    ExploreView()
}
