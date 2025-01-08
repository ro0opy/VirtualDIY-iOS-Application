//
//  SearchView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = "" // State untuk teks pencarian
    @State private var isLoading: Bool = false // State untuk spinner loading
    
    // Data untuk ditampilkan (menggunakan mock data dari diyItems)
    let items: [DIYItem] = diyItems
    
    // Filtered items berdasarkan teks pencarian
    var filteredItems: [DIYItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Header (Logo dan Foto Profil)
                HStack {
                    Image("VDA") // Ganti dengan nama asset logo
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 70)
                    
                    Spacer()
                    
                    Image("People") // Ganti dengan nama asset foto profil
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Search Bar
                TextField("Search for items...", text: $searchText)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)))
                    .padding(.horizontal)
                
                // Daftar Item (menggunakan CardView)
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(filteredItems) { item in
                            NavigationLink(destination: destinationView(for: item)) {
                                CardView(item: item)
                                    .padding(.horizontal)
                            }
                        }
                        
                        // Jika tidak ada hasil
                        if filteredItems.isEmpty {
                            Text("No items found")
                                .foregroundColor(.secondary)
                                .padding(.top, 20)
                        }
                    }
                }
                .padding(.top)
                
                Spacer()
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                // Simulasi loading (opsional)
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isLoading = false
                }
            }
        }
    }
    @ViewBuilder
        func destinationView(for item: DIYItem) -> some View {
            if item.title.lowercased().contains("bunk bed") {
                BunkBedInfoView(item: item)
            } else if item.title.lowercased().contains("dresser"){
                DresserInfoView(item: item)
            } else {
                InfoView(item: item)
            }
        }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

