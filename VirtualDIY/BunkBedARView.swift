//
//  TwinBunkBedARView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 21/12/2024.
//

import SwiftUI
import SceneKit

struct BunkBedARView: View {
    @State var scene: SCNScene? = SCNScene(named: "Twin_Over_Full_Bunk_Bed.scn") ?? SCNScene()
    
    var body: some View {
        CustomScene(scene: $scene)
            .frame(height: 350)
            .padding()
    }
}

#Preview {
    BunkBedARView()
}
