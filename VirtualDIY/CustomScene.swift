//
//  CustomBBScene.swift
//  VirtualDIY
//
//  Created by STDC_6 on 21/12/2024.
//

import SwiftUI
import SceneKit

struct CustomScene: UIViewRepresentable {
    @Binding var scene: SCNScene?
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.autoenablesDefaultLighting = true
        view.allowsCameraControl = true
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context){
        uiView.scene = scene
    }
}

#Preview {
    CustomScene(scene: .constant(SCNScene()))
}
