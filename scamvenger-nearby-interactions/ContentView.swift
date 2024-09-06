//
//  ContentView.swift
//  scamvenger-nearby-interactions
//
//  Created by Jia Chen Yee on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var interactions = Interactions()
    
    var body: some View {
        VStack {
            Spacer()
            
            if let distance = interactions.data?.distance {
                Text("\(String(format: "%0.2f m", distance))")
                    .contentTransition(.numericText())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .monospacedDigit()
            }
            
            Group {
                if let azimuth = interactions.data?.azimuth {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 300))
                        .foregroundStyle(.tint)
                        .rotationEffect(Angle(radians: Double(azimuth)))
                } else {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(.tint)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            
            HStack {
                if let azimuth = interactions.data?.azimuth {
                    VStack {
                        Text("Azimuth")
                            .font(.headline)
                        Text("\(String(format: "%0.2f°", azimuth))")
                            .font(.title3)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Divider()
                
                if let elevation = interactions.data?.elevation {
                    VStack {
                        Text("Elevation")
                            .font(.headline)
                        Text("\(String(format: "%0.2f°", elevation))")
                            .font(.title3)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .frame(height: 50)
            .monospacedDigit()
            
            Spacer()
            
            Text(interactions.informationText)
        }
        .padding()
        .onAppear {
            interactions.startup()
        }
    }
}

#Preview {
    ContentView()
}
