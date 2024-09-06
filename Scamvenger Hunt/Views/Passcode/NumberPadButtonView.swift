//
//  NumberPadButtonView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 7/9/24.
//

import SwiftUI

struct NumberPadButtonView: View {
    
    @Environment(Passcode.self) private var passcode
    
    var label: String
    var deleteButton: Bool = false
    
    var body: some View {
        Button {
            if !deleteButton {
                passcode.addValue(value: label)
            } else {
                passcode.delete()
            }
        } label: {
            Group {
                if !deleteButton {
                    Text(label)
                } else {
                    Image(systemName: label)
                }
            }
            .padding()
            .foregroundStyle(.tint)
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.tint.opacity(0.2))
        }
        .buttonStyle(.plain)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
