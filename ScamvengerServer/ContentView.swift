//
//  ContentView.swift
//  ScamvengerServer
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var width: CGFloat = 0
    
    var body: some View {
        VStack {
            Grid(alignment: .topLeading, horizontalSpacing: 0, verticalSpacing: 0) {
                GridRow {
                    RoomView(room: .pantry, hasBorder: false, filled: false)
                        .gridCellColumns(10)
                    RoomView(filled: false)
                        .gridCellColumns(6)
                    RoomView(filled: false)
                        .gridCellColumns(6)
                    RoomView(hasBorder: false, filled: false)
                        .gridCellColumns(2)
                }
                GridRow {
                    RoomView(room: .somerset, hasBorder: true)
                        .gridCellColumns(4)
                    RoomView(room: .dhobyGhaut, hasBorder: true)
                        .gridCellColumns(4)
                    RoomView(hasBorder: false, filled: false)
                        .gridCellColumns(2)
                    RoomView(hasBorder: true)
                        .gridCellColumns(12)
                    RoomView(hasBorder: false, filled: false)
                        .gridCellColumns(2)
                }
                GridRow {
                    Rectangle()
                        .fill(.clear)
                        .frame(height: width / 11)
                }
                GridRow {
                    RoomView(room: .orchard, hasBorder: true)
                        .gridCellColumns(6)
                    RoomView(filled: false)
                        .gridCellColumns(2)
                    RoomView(hasBorder: false, filled: false)
                        .gridCellColumns(2)
                    RoomView(room: .newton, hasBorder: true)
                        .aspectRatio(1, contentMode: .fit)
                        .gridCellColumns(3)
                        .gridCellAnchor(.top)
                    RoomView(filled: false)
                        .aspectRatio(1, contentMode: .fit)
                        .gridCellColumns(3)
                        .gridCellAnchor(.top)
                    RoomView(room: .toaPayoh, hasBorder: true)
                        .gridCellColumns(4)
                    RoomView(room: .braddell, hasBorder: true)
                        .gridCellColumns(4)
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .onGeometryChange(for: CGFloat.self) { proxy in
                min(proxy.size.width, proxy.size.height)
            } action: { newValue in
                width = newValue
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
