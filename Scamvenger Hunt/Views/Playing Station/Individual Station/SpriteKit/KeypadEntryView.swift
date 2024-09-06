//
//  KeypadEntryView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 9/5/24.
//

import SwiftUI

struct KeypadEntryView: View {
    
    @Binding var currentMapIndex: Int?
    @State private var width = 0.0
    
    @State private var inputValues: [KeypadKey] = []
    
    var body: some View {
        Grid {
            GridRow {
                KeypadDisplayView(inputValues: inputValues)
                    .gridCellColumns(3)
            }
            
            GridRow {
                KeypadButtonView(key: .circle, inputValues: $inputValues)
                KeypadButtonView(key: .triangle, inputValues: $inputValues)
                KeypadButtonView(key: .square, inputValues: $inputValues)
            }
            
            GridRow {
                KeypadButtonView(key: .pentagon, inputValues: $inputValues)
                KeypadButtonView(key: .hexagon, inputValues: $inputValues)
                KeypadButtonView(key: .octagon, inputValues: $inputValues)
            }
            
            GridRow {
                Rectangle()
                    .fill(.clear)
                    .gridCellColumns(2)
                
                Button {
                    if !inputValues.isEmpty {
                        inputValues.removeLast()
                    }
                } label: {
                    Image(systemName: "delete.backward")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .clipShape(.rect(cornerRadius: 8))
                }
                .disabled(inputValues.isEmpty)
            }
        }
        .padding()
        .background(.tint.opacity(0.2))
        .clipShape(.rect(cornerRadius: 8))
        .frame(width: width / 2)
        .frame(maxWidth: .infinity, alignment: .center)
        .onGeometryChange(for: Double.self) { proxy in
            proxy.size.width
        } action: { newValue in
            width = newValue
        }
        .onChange(of: inputValues) { oldValue, newValue in
            currentMapIndex = KeypadKey.getMapIndexForCombination(newValue)
        }
    }
}
