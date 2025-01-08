//
//  DresserARView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 21/12/2024.
//

import SwiftUI
import SceneKit

struct DresserARView: View {
    @State var scene: SCNScene? = SCNScene(named: "Dresser.scn") ?? SCNScene()
    
    var body: some View {
        CustomScene(scene: $scene)
            .frame(height: 350)
            .padding()
    }
}

#Preview {
    DresserARView()
}
