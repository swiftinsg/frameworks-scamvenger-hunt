//
//  KeypadButtonView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 9/5/24.
//

import SwiftUI

struct KeypadButtonView: View {
    
    var key: KeypadKey
    
    @Binding var inputValues: [KeypadKey]
    
    var body: some View {
        Button {
            if inputValues.count != 4 {
                inputValues.append(key)
            }
        } label: {
            Image(systemName: key.symbol)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .background(.tint)
                .clipShape(.rect(cornerRadius: 8))
        }
    }
}
