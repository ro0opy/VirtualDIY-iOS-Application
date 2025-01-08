//
//  HeaderView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            Image("VDA")
                .resizable()
                .frame(width: 64, height: 64)
                .padding()
            Spacer()
            NavigationLink(destination: SubscriptionView()) {
                Image("People")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            }
            Spacer().frame(width: 20)
        }
    }
}

#Preview {
    HeaderView()
}
