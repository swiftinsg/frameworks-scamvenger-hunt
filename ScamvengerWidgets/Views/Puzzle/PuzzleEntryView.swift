//
//  PuzzleEntryView.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI
import WidgetKit

struct PuzzleEntryView : View {
    var entry: PuzzleProvider.Entry
    
    var emptySpot: Position {
        let allPositions: Set<Position> = [
            .topLeading, .top, .topTrailing,
            .leading, .center, .trailing,
            .bottomLeading, .bottom, .bottomTrailing
        ]
        
        return allPositions.subtracting([topLeadingCurrentPosition, topCurrentPosition, topTrailingCurrentPosition, leadingCurrentPosition, centerCurrentPosition, trailingCurrentPosition, bottomLeadingCurrentPosition, bottomCurrentPosition]).first!
    }
    
    @AppStorage("topLeadingCurrentPosition", store: .puzzleStore) var topLeadingCurrentPosition = Position.topLeading
    @AppStorage("topCurrentPosition", store: .puzzleStore) var topCurrentPosition = Position.top
    @AppStorage("topTrailingCurrentPosition", store: .puzzleStore) var topTrailingCurrentPosition = Position.topTrailing
    @AppStorage("leadingCurrentPosition", store: .puzzleStore) var leadingCurrentPosition = Position.leading
    @AppStorage("centerCurrentPosition", store: .puzzleStore) var centerCurrentPosition = Position.center
    @AppStorage("trailingCurrentPosition", store: .puzzleStore) var trailingCurrentPosition = Position.trailing
    @AppStorage("bottomLeadingCurrentPosition", store: .puzzleStore) var bottomLeadingCurrentPosition = Position.bottomLeading
    @AppStorage("bottomCurrentPosition", store: .puzzleStore) var bottomCurrentPosition = Position.bottom
    
    @AppStorage("isShuffling", store: .puzzleStore) var isShuffling = false
    
    var body: some View {
        VStack {
            VStack {
                GeometryReader { reader in
                    let imageWidth = min(reader.size.width, reader.size.height)
                    
                    ZStack {
                        Button(intent: ShuffleAppIntent()) {
                            Rectangle()
                                .frame(width: imageWidth / 3, height: imageWidth / 3)
                                .opacity(0.01)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: emptySpot.toAlignment())
                        
                        ImageTileView(width: imageWidth,
                                      position: .topLeading,
                                      currentPosition: topLeadingCurrentPosition,
                                      intent: MoveTopLeading())
                        
                        ImageTileView(width: imageWidth,
                                      position: .top,
                                      currentPosition: topCurrentPosition,
                                      intent: MoveTop())
                        
                        ImageTileView(width: imageWidth,
                                      position: .topTrailing,
                                      currentPosition: topTrailingCurrentPosition,
                                      intent: MoveTopTrailing())
                        
                        ImageTileView(width: imageWidth,
                                      position: .leading,
                                      currentPosition: leadingCurrentPosition,
                                      intent: MoveLeading())
                        
                        ImageTileView(width: imageWidth,
                                      position: .center,
                                      currentPosition: centerCurrentPosition,
                                      intent: MoveCenter())
                        
                        ImageTileView(width: imageWidth,
                                      position: .trailing,
                                      currentPosition: trailingCurrentPosition,
                                      intent: MoveTrailing())
                        
                        ImageTileView(width: imageWidth,
                                      position: .bottomLeading,
                                      currentPosition: bottomLeadingCurrentPosition,
                                      intent: MoveBottomLeading())
                        
                        ImageTileView(width: imageWidth,
                                      position: .bottom,
                                      currentPosition: bottomCurrentPosition,
                                      intent: MoveBottom())
                        
                        ZStack {
                            HStack {
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 1)
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 1)
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 1)
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 1)
                            }
                            
                            VStack {
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 1)
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 1)
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 1)
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 1)
                            }
                        }
                        .allowsHitTesting(false)
                    }
                    .frame(width: imageWidth, height: imageWidth)
                    .buttonStyle(.plain)
                }
                .aspectRatio(1, contentMode: .fit)
            }
        }
        .containerBackground(.fill.tertiary, for: .widget)
    }
}
