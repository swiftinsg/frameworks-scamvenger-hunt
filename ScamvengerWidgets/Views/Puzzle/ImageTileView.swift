//
//  ImageTileView.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI
import AppIntents

struct ImageTileView: View {
    
    var width: Double
    var position: Position
    
    var currentPosition: Position
    
    var intent: any AppIntent
    
    var body: some View {
        ZStack(alignment: currentPosition.toAlignment()) {
            Image("Image")
                .resizable()
                .scaledToFit()
                .frame(width: width, height: width)
                .mask(alignment: position.toAlignment()) {
                    Rectangle()
                        .frame(width: width / 3, height: width / 3)
                }
                .offset(x: {
                    switch currentPosition.horizontal {
                    case .leading:
                        if position.horizontal == .leading {
                            return 0
                        } else if position.horizontal == .trailing {
                            return -width / 3 * 2
                        } else {
                            return -width / 3
                        }
                    case .trailing:
                        if position.horizontal == .leading {
                            return width / 3 * 2
                        } else if position.horizontal == .trailing {
                            return 0
                        } else {
                            return width / 3
                        }
                    default:
                        if position.horizontal == .leading {
                            return width / 3
                        } else if position.horizontal == .center {
                            return 0
                        } else {
                            return -width / 3
                        }
                    }
                }(), y: {
                    switch currentPosition.vertical {
                    case .top:
                        if position.vertical == .top {
                            return 0
                        } else if position.vertical == .bottom {
                            return -width / 3 * 2
                        } else {
                            return -width / 3
                        }
                    case .bottom:
                        if position.vertical == .top {
                            return width / 3 * 2
                        } else if position.vertical == .bottom {
                            return 0
                        } else {
                            return width / 3
                        }
                    default:
                        if position.vertical == .top {
                            return width / 3
                        } else if position.vertical == .center {
                            return 0
                        } else {
                            return -width / 3
                        }
                    }
                }())
                .allowsHitTesting(false)
            Button(intent: intent) {
                Rectangle()
                    .opacity(0.001)
                    .frame(width: width / 3, height: width / 3)
            }
        }
    }
}
