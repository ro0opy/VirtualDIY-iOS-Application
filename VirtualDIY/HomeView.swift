//
//  HomeView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct HomeView: View {
    let topPicksImages = [
        "lamp1",      // Gantikan dengan nama gambar anda
        "ampain1",
        "sofabed1"
    ]
    
    let categories = [
        Category(name: "Home Repair", image: "homerepair"),
        Category(name: "Craft & Hobbies", image: "crafthobby"),
        Category(name: "Outdoors", image: "outdoor"),
        Category(name: "Woodworking", image: "woodworking"),
        Category(name: "Kids", image: "kidscraft"),
        Category(name: "Technology & Electroniocs", image: "tech")
        
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView()
                
                // Top Picks Slider
                TabView {
                    ForEach(topPicksImages, id: \.self) { imageName in
                        GeometryReader { geometry in
                            ZStack {
                                // Fokus gambar utama
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200)
                                    .overlay(
                                        Text("Top Picks")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(.white)
                                            .padding(),
                                        alignment: .bottomLeading
                                    )
                                    .frame(width: calculateWidth(proxy: geometry), height: calculateHeight(proxy: geometry))
                                    .clipped()
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    
                                    .scaleEffect(calculateScale(proxy: geometry))
                                    .animation(.easeInOut, value: calculateScale(proxy: geometry))
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 300)
                
                // Categories Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("Categories")
                        .font(.headline)
                        .bold()
                        .padding(.horizontal)
                        
                    
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 10) {
                        ForEach(categories, id: \.id) { category in
                            VStack {
                                Image(category.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 110, height: 130)
                                    .clipped()
                                    .cornerRadius(10)
                                    .overlay(
                                        Text(category.name)
                                            .font(.caption)
                                            .bold()
                                            .foregroundColor(.white)
                                            .padding(6),
                                        alignment: .bottom
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                Spacer()
                
               
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
    
    // Fungsi untuk kira skala
    private func calculateScale(proxy: GeometryProxy) -> CGFloat {
        let midPoint = UIScreen.main.bounds.width / 2
        let currentX = proxy.frame(in: .global).midX
        let distance = abs(midPoint - currentX)
        let scale = 1 - (distance / midPoint) * 0.5 // Kurangkan skala lebih jelas
        return max(0.5, scale) // Minimum skala dinaikkan ke 0.6
    }
    
    // Fungsi untuk kira kelebaran gambar
    private func calculateWidth(proxy: GeometryProxy) -> CGFloat {
        let midPoint = UIScreen.main.bounds.width / 2
        let currentX = proxy.frame(in: .global).midX
        let distance = abs(midPoint - currentX)
        let width = UIScreen.main.bounds.width * 0.8 - (distance / midPoint) * 100
        return max(200, width) // Lebar minimum
    }
    
    // Fungsi untuk kira ketinggian gambar
    private func calculateHeight(proxy: GeometryProxy) -> CGFloat {
        let height = 300
        return CGFloat(height)
    }
}

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

struct TabBarItem: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.headline)
            Text(label)
                .font(.caption)
        }
        .foregroundColor(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

