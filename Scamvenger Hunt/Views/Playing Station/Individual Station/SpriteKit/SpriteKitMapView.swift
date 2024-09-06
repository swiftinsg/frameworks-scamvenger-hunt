//
//  SpriteKitMapView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 9/5/24.
//

import SwiftUI
import SpriteKit

struct SpriteKitMapView: View {
    
    var scene: SKScene
    
    init(index: Int, geometrySize: CGSize, onComplete: (() -> Void)!) {
        let scene = SpriteKitCoreMotionScene()
        scene.size = geometrySize
        scene.mazeIndex = index
        scene.backgroundColor = .clear
        scene.scaleMode = .fill
        scene.onComplete = onComplete
        
        self.scene = scene
    }
    
    var body: some View {
        ZStack {
            ProgressView()
            SpriteView(scene: scene, options: .allowsTransparency)
                .background(.white)
        }
    }
}
