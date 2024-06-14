//
//  Listing.swift
//  AirbnbClone
//
//  Created by Melih Dural on 14.06.2024.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    let numberOfNights: Int
    let imageUrls: [String]
    
    var pricePerNight: Int
    
    let latitude: Double
    let longitude: Double
    
    let address: String
    let city: String
    let state: String
    let title: String
    
    var rating: Double
    
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    
    var type: ListingType
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
    var imageName: String {
        switch self {
            case .selfCheckIn: return "door.left.hand.open"
            case .superHost: return "medal"
        }
    }
    
    var title: String {
        switch self {
            case .selfCheckIn: return "Self Check-In"
            case .superHost: return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
            case .selfCheckIn: return "Check yourself in with the keypad."
            case .superHost: return "Superhost are experienced, highly rated host who are commited to providing grate stars for guests."
        }
    }
    
    var id: Int { return self.rawValue }
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String {
        switch self {
            case .pool: return "Pool"
            case .kitchen: return "Kitchen"
            case .wifi: return "Wifi"
            case .laundry: return "Laundry"
            case .tv: return "TV"
            case .alarmSystem: return "Alarm System"
            case .office: return "Office"
            case .balcony: return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
            case .pool: return "figure.pool.swim"
            case .kitchen: return "fork.knife"
            case .wifi: return "wifi"
            case .laundry: return "washer"
            case .tv: return "tv"
            case .alarmSystem: return "checkerboard.shield"
            case .office: return "pencil.and.ruler.fill"
            case .balcony: return "building"
        }
    }
    
    var id: Int { return self.rawValue }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var description: String {
        switch self {
            case .apartment: return "Apartment"
            case .house: return "House"
            case .townHouse: return "Town House"
            case .villa: return "Villa"
        }
    }
    
    var id: Int { return self.rawValue }
}
