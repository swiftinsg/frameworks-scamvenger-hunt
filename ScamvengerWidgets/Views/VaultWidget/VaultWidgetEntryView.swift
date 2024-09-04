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
                    button(title: "1")
                    button(title: "2")
                    button(title: "3")
                }
                HStack {
                    button(title: "4")
                    button(title: "5")
                    button(title: "6")
                }
                HStack {
                    button(title: "7")
                    button(title: "8")
                    button(title: "9")
                }
                HStack {
                    button(title: "delete", systemName: "delete.backward")
                    button(title: "0")
                    button(title: "check", systemName: "checkmark")
                }
            case .unlocked:
                Spacer()
                Text("super duper top secret")
                Text("sigma")
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
        .foregroundStyle(.black)
    }
    
    @ViewBuilder
    func button(title: String = "", systemName: String = "") -> some View {
        Button(intent: VaultPasswordIntent(code: title)) {
            Group {
                if systemName.isEmpty {
                    Text(title)
                } else {
                    Image(systemName: systemName)
                }
            }
            .frame(width: 40, height: 40)
        }
        .buttonStyle(.bordered)
        .tint(.gray.opacity(0.75))
    }
}
