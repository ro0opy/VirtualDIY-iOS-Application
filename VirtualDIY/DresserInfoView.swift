//
//  DresserInfoView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 23/12/2024.
//

import SwiftUI

struct DresserInfoView: View {
    // Mengambil data item pertama dari diyItems
    let item: DIYItem
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Image Section
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 250)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                
                // AR Button Section
                HStack {
                    NavigationLink(destination: DresserARCamera()) {
                        Text("Try in AR 🔒")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.yellow)
                            .cornerRadius(25)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                
                // Materials Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Materials")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    ForEach(item.materials, id: \.self) { material in
                        Text("• \(material)")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Tutorial Video Section
                VStack(alignment: .leading, spacing: 15) {
                    Text("Tutorial Video")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    WebView(url: item.tutorialURL)
                        .frame(height: 200)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                
                // Divider for separation
                Divider()
                    .frame(height: 2)
                    .background(Color.gray.opacity(0.3))
                    .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(Color(.systemGroupedBackground)) // Background untuk keseluruhan halaman
        .navigationTitle("DIY Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    DresserInfoView(item: DIYItem(title: "Simple Dresser", imageName: "simpledresser", materials: [
        "3/4' plywood for the dresser frame and drawer fronts",
        "1/4' plywood for the drawer bottoms and back panel",
        "2x2 boards for the dresser frame",
        "1x2 boards for drawer supports and guides",
        "Drawer slides (16' recommended)",
        "Handles or knobs for the drawers",
        "Pocket hole screws (1 1/4' and 2 1/2')",
        "Wood screws for assembly",
        "1 1/4' finish nails",
        "Wood glue"], tutorialURL: URL(string: "https://youtu.be/faObh6a7kAc?si=XG2sO9Q5L0NSrzig")!))
}

