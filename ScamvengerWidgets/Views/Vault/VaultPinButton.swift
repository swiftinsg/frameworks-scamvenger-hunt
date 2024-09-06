//
//  VaultPinButton.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI

struct VaultPinButton: View {
    
    var title: String = ""
    var systemName: String = ""
    
    var body: some View {
        Button(intent: VaultPasswordIntent(code: title)) {
            Group {
                if systemName.isEmpty {
                    Text(title)
                } else {
                    Image(systemName: systemName)
                }
            }
            .frame(width: 40, height: 40)
            .foregroundStyle(.primary)
        }
        .buttonStyle(.bordered)
        .tint(.secondary)
    }
}

#Preview {
    VaultPinButton()
}
