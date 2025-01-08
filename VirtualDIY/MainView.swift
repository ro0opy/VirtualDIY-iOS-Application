//
//  Main.swift
//  VirtualDIY
//
//  Created by STDC_6 on 18/12/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            
            SearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            ARCameraView()
                .tabItem{
                    Label("AR", systemImage: "camera.fill")
                }
            
            CommunityView()
                .tabItem {
                    Label("Community", systemImage: "person.3.fill")
                }
        }
        .padding().frame(height: 900)
    }
}

#Preview {
    MainView()
}
