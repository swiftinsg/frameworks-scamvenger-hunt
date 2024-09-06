//
//  KeypadDisplayView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 9/5/24.
//

import SwiftUI

struct KeypadDisplayView: View {
    
    var inputValues: [KeypadKey]
    
    var body: some View {
        HStack {
            if inputValues.count == 4 {
                if KeypadKey.getMapIndexForCombination(inputValues) == nil {
                    VStack {
                        Text("Incorrect Code")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Delete and try again.")
                    }
                } else {
                    Text("Loading…")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            } else {
                ForEach(0..<4) { keyIndex in
                    if inputValues.count > keyIndex {
                        Image(systemName: inputValues[keyIndex].symbol)
                            .frame(maxWidth: .infinity)
                    } else {
                        Image(systemName: "staroflife.fill")
                            .frame(maxWidth: .infinity)
                    }
                }
                .font(.system(size: 50))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white.opacity(0.3))
        .clipShape(.rect(cornerRadius: 8))
    }
}
