//
//  SetUpView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/29/24.
//

import SwiftUI
import Vision

struct SetUpView: View {
    
    @State private var showingCamera = false
    @State private var image: UIImage?
    @State private var setUp = SetUp()
    
    var body: some View {
        VStack {
            if image == nil {
                WelcomeView(showingCamera: $showingCamera)
            } else {
                ReviewFacesView(showingCamera: $showingCamera)
            }
        }
        .fullScreenCover(isPresented: $showingCamera) {
            CameraView(selectedImage: $image)
        }
        .onChange(of: image) {
            if let image = image {
                setUp.detectFaces(image: image)
            }
        }
        .environment(setUp)
    }
}

#Preview {
    SetUpView()
}
