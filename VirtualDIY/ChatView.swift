//
//  ChatView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct ChatView: View {
    @State private var message = ""
    var body: some View {
        HStack{
            Image("People")
                .resizable()
                .frame(width: 50, height: 64)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            TextField("Type here", text: $message)
            Button(action:{}){
                Text("Post")
            
            }
            .foregroundColor(.brown)
            .fontWeight(.bold)
        }
        .padding(4)
        .background(Color.yellow.opacity(0.3))
        .cornerRadius(50)
    }
}

#Preview {
    ChatView()
}
