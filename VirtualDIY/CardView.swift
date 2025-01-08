//
//  CardView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct CardView: View {
    let item: DIYItem

    var body: some View {
        HStack {
            Image(item.imageName) // Gambar dari item
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
                .shadow(radius: 3)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(item.materials.joined(separator: ", ")) // Menampilkan bahan dalam format singkat
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    CardView(item: DIYItem(title: "Wood Sofa Bed", imageName: "sofabed1", materials: [
        "(6) 2 x 12 Southern yellow pine",
        "(5) 2 x 3 lumber",
        "(6) 1 x 4 lumber",
        "1/2-inch dowels",
        "Lots of screws",
        "Wood glue"], tutorialURL: URL(string: "https://youtu.be/jPXwq0enhvE?si=Qh8Pm2Pe8l-3uiQ_")!))
}

