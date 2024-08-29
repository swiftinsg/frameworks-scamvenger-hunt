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
    
    @Environment(Game.self) private var game
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            if image != nil {
                Text(LocalizedStringKey("Ensure that all your group mates are here! Press \(Image(systemName: "minus.circle.fill").symbolRenderingMode(.multicolor)) to remove any misidentifications."))
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(30)
                faceGrid
                continueButton
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
    
    var photoButton: some View {
        Button {
            showingCamera.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 32)
                .foregroundStyle(.white.opacity(0.01))
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(Color.secondary, lineWidth: 6)
                        VStack {
                            Text("Swift Accelerator Scamvenger Hunt.")
                                .font(.title)
                            
                            Text("Tap to take a picture of your group members to get started.")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
        }
        .buttonStyle(.plain)
        .padding(30)
    }
    
    var faceGrid: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(setUp.temporaryPlayers, id: \.id) { player in
                        ZStack {
                            Circle()
                                .foregroundStyle(player.color.color)
                                .frame(width: 210)
                            Group {
                                if let profilePicture = player.profilePicture {
                                    Image(uiImage: profilePicture)
                                        .resizable()
                                } else {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                }
                            }
                            .scaledToFit()
                            .frame(width: 200)
                            .overlay(alignment: .topTrailing) {
                                Button {
                                    setUp.removeTempPlayer(player: player)
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
                }
                .padding()
            }
            .frame(maxHeight: .infinity)
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .padding(.horizontal)
        }
    }
    
    var continueButton: some View {
        Button {
            game.players = setUp.temporaryPlayers
            game.state = .playingIdle
        } label: {
            Text("Continue")
                .padding()
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
        .disabled(setUp.temporaryPlayers.count > 4 && setUp.temporaryPlayers.count < 1)
        .padding(.vertical)
    }
}

#Preview {
    SetUpView()
}
