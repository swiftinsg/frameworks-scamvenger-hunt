//
//  NumberPadView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 7/9/24.
//

import SwiftUI

struct NumberPadView: View {
    
    @Environment(Passcode.self) private var passcode
    
    var body: some View {
        VStack {
            HStack {
                ForEach(1...3, id: \.self) { i in
                    NumberPadButtonView(label: "\(i)")
                        .environment(passcode)
                }
            }
            
            HStack {
                ForEach(4...6, id: \.self) { i in
                    NumberPadButtonView(label: "\(i)")
                        .environment(passcode)
                }
            }
            
            HStack {
                ForEach(7...9, id: \.self) { i in
                    NumberPadButtonView(label: "\(i)")
                        .environment(passcode)
                }
            }
            
            HStack {
                Rectangle()
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                NumberPadButtonView(label: "0")
                    .environment(passcode)
                NumberPadButtonView(label: "delete.left", deleteButton: true)
                    .environment(passcode)
            }
        }
    }
}

#Preview {
    NumberPadView()
}
