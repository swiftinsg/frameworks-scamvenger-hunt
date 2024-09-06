//
//  DebugView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct DebugView: View {
    
    @State private var passcodeEntered = false
    
    var body: some View {
        if passcodeEntered {
            DebugControlsView()
        } else {
            PasscodeView { result in
                withAnimation {
                    passcodeEntered = result
                }
            }
        }
    }
}

#Preview {
    DebugView()
}
