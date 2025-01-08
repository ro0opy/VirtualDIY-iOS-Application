//
//  InfoView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct InfoView: View {
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
                    NavigationLink(destination: ARCameraView()) {
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
    InfoView(item: DIYItem(title: "Wood Sofa Bed", imageName: "WoodSofa", materials: [
        "(6) 2 x 12 Southern yellow pine",
        "(5) 2 x 3 lumber",
        "(6) 1 x 4 lumber",
        "1/2-inch dowels",
        "Lots of screws",
        "Wood glue"], tutorialURL: URL(string: "https://youtu.be/jPXwq0enhvE?si=Qh8Pm2Pe8l-3uiQ_")!))
}

