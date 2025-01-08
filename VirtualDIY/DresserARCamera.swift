//
//  DresserARCamera.swift
//  VirtualDIY
//
//  Created by STDC_6 on 21/12/2024.
//

import SwiftUI
import RealityKit
import ARKit

struct DresserARCamera: View {
    @State private var isCameraEnabled = true

    var body: some View {
        VStack {
            if isCameraEnabled {
                DresserRealityView()
                    .frame(width: 350, height: 450)
            } else {
                DresserARView()
            }

            Button(action: {
                isCameraEnabled.toggle() // Toggle camera state
            }) {
                Image(systemName: isCameraEnabled ? "camera.fill" : "camera.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(isCameraEnabled ? .green : .red)
                    .padding()
                    .background(Circle().fill(Color.gray))
            }
            .padding(.bottom)
        }
    }
}

struct DresserRealityView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.automaticallyConfigureSession = false
        
        // Configure AR session
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)

        if let url = Bundle.main.url(forResource: "Dresser", withExtension: "usdz") {
            if let entity = try? Entity.load(contentsOf: url) {
                
                let cameraAnchor = AnchorEntity(.camera)
                cameraAnchor.addChild(entity)
                entity.position = [0, -0.5, -2]
                
                let rotationAngle = Float(25) * Float.pi / 180
                entity.orientation = simd_quatf(angle: rotationAngle, axis: [1, 0, 0])
                
                arView.scene.anchors.append(cameraAnchor)
            } else {
                print("Failed to load the USDZ file.")
            }
        } else {
            print("Failed to find the USDZ file in the bundle.")
        }
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func dismantleUIView(_ uiView: ARView, coordinator: Context) {
        uiView.session.pause()
    }
}

#Preview {
    DresserARCamera()
}
