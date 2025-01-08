//
//  BunkBedWebView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 23/12/2024.
//

import SwiftUI
import WebKit

struct BunkBedWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    BunkBedWebView(url: URL(string: "https://youtu.be/EzQTtEqP-8o?si=oOayHtZmBBHuDc9Q")!)
}
