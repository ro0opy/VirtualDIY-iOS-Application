//
//  DresserWebView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 23/12/2024.
//

import SwiftUI
import WebKit

struct DresserWebView: UIViewRepresentable {
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
    DresserWebView(url: URL(string: "https://youtu.be/faObh6a7kAc?si=XG2sO9Q5L0NSrzig")!)
}
