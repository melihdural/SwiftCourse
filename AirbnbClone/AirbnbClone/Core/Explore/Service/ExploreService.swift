//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by Melih Dural on 14.06.2024.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listings
    }
    
    func searchListings(with query: String) -> [Listing]{
        
        if query.isEmpty{
            return DeveloperPreview.shared.listings
        }
        
        var list =  DeveloperPreview.shared.listings.filter{
            $0.city.lowercased().contains(query.lowercased()) || $0.state.lowercased().contains(query.lowercased()) || $0.title.lowercased().contains(query.lowercased())}
        
        return list
    }
}
