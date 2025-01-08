//
//  CommunityView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack {
                    HeaderView()
                    ChatView()
                        .padding()
                    
                    Divider()
                    ReviewView()
                  
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct CommunityPostView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}

