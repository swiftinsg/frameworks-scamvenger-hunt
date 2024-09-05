//
//  VaultWidgetEntryView.swift
//  ScamvengerWidgetsExtension
//
//  Created by Tristan Chay on 5/9/24.
//

import SwiftUI
import WidgetKit

struct VaultWidgetEntryView: View {
    var entry: VaultWidgetProvider.Entry
    
    var body: some View {
        VStack {
            switch entry.state {
            case .locked:
                Text("Secure Vault Pro Max")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Button(intent: VaultToggleIntent()) {
                    Image(systemName: "lock.shield.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 96)
                        .foregroundStyle(.red)
                }
                .buttonStyle(.plain)
            case .password:
                Text(String(entry.password))
                HStack {
                    VaultPinButton(title: "1")
                    VaultPinButton(title: "2")
                    VaultPinButton(title: "3")
                }
                HStack {
                    VaultPinButton(title: "4")
                    VaultPinButton(title: "5")
                    VaultPinButton(title: "6")
                }
                HStack {
                    VaultPinButton(title: "7")
                    VaultPinButton(title: "8")
                    VaultPinButton(title: "9")
                }
                HStack {
                    VaultPinButton(title: "delete", systemName: "delete.backward")
                    VaultPinButton(title: "0")
                    VaultPinButton(title: "check", systemName: "checkmark")
                }
            case .unlocked:
                Spacer()
                Text("My favourite emoji:")
                    .fontWeight(.bold)
                Text("😐")
                    .font(.system(size: 86))
                Spacer()
                Button(intent: VaultToggleIntent()) {
                    HStack {
                        Image(systemName: "lock.open.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16)
                        Text("Tap to Lock Vault")
                    }
                    .foregroundStyle(.white)
                    .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green.opacity(0.75))
            }
        }
        .padding()
        .fontDesign(.monospaced)
    }
}
