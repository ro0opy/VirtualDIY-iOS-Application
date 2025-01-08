//
//  ARCameraView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 21/12/2024.
//

import SwiftUI
import RealityKit
import ARKit

struct ARCameraView: View {
    @State private var isCameraEnabled = true

    var body: some View {
        VStack {
            if isCameraEnabled {
                ARRealityView()
                    .frame(width: 350, height: 450)
                    .border(Color.blue, width: 1)
            } else {
                Color.black // Black screen when the camera is off
                    .frame(width: 350, height: 450)
                    .border(Color.blue, width: 1)
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

struct ARRealityView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.automaticallyConfigureSession = false
        
        // Configure AR session
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)

        // Add a 3D model anchored in front of the camera
        let anchor = AnchorEntity(world: [0, 0, -0.5]) // 0.5 meters in front of the camera
        let model = ModelEntity(mesh: .generateBox(size: 0.1), materials: [SimpleMaterial(color: .white, isMetallic: false)])
        anchor.addChild(model)
        arView.scene.addAnchor(anchor)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func dismantleUIView(_ uiView: ARView, coordinator: Context) {
        uiView.session.pause()
    }
}

#Preview {
    ARCameraView()
}

