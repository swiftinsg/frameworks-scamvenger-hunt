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
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            if let image = image {
                Text(LocalizedStringKey("Ensure that all your group mates are here! Press to \(Image(systemName: "minus.circle.fill").symbolRenderingMode(.multicolor)) to remove any misidentifications."))
                    .font(.title)
                    .fontDesign(.monospaced)
                    .multilineTextAlignment(.center)
                    .padding(.top, 30)
                
                Spacer()
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(setUp.extractFaces(image: image, observations: setUp.faces), id: \.self) { uiimage in
                        Image(uiImage: uiimage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160)
                            .overlay(alignment: .topTrailing) {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "minus.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .symbolRenderingMode(.multicolor)
                                }
                                .buttonStyle(.plain)
                            }
                    }
                }
                Spacer()
            } else {
                photoButton
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
    }
    
//    var peoplesGrid: some View {
//
//    }
    
    var photoButton: some View {
        Button {
            image = UIImage(named: "people")
        } label: {
            RoundedRectangle(cornerRadius: 32)
                .foregroundStyle(.white.opacity(0.01))
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(Color.secondary, lineWidth: 6)
                        
                        Text("Tap here to take a picture.")
                            .font(.title)
                            .fontDesign(.monospaced)
                    }
                }
        }
        .buttonStyle(.plain)
        .padding(30)
    }
}

#Preview {
    SetUpView()
}
