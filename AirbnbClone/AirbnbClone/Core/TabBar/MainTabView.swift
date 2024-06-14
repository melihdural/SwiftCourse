//
//  MainTabView.swift
//  AirbnbClone
//
//  Created by Melih Dural on 14.06.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            
            WishlistView()
                .tabItem {
                    Label("Wishlists", systemImage: "heart")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainTabView()
}
