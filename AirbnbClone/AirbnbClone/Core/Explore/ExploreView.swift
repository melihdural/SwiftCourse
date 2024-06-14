//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 12.06.2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var isShowingFilter = false
    var body: some View {
        NavigationStack{
            if isShowingFilter{
                DestinationSearchView(show: $isShowingFilter)
            }
            else{
                SearchFilterBarView()
                    .onTapGesture {
                        withAnimation(.snappy){
                            isShowingFilter.toggle()
                        }
                    }
                ScrollView{
                    LazyVStack(spacing: 32){
                        ForEach(0 ... 10, id: \.self){ listing in
                            NavigationLink(value: listing){
                                ListItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding()
                    }
                    .navigationDestination(for: Int.self){ listing in
                        ListingDetailView()
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
