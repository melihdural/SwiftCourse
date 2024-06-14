//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Melih Dural on 14.06.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings: [Listing] = []
    @Published var searchText = ""
    private let service: ExploreService
    
    init(service: ExploreService){
        self.service = service
        
        Task {
            await fetchListings()
        }
    }
    
    func fetchListings() async {
        do {
            listings = try await service.fetchListings()
        } catch {
            print("Error fetching listings: \(error)")
        }
    }
    
    func searchListings(query: String) {
        listings = service.searchListings(with: query)
    }
}
