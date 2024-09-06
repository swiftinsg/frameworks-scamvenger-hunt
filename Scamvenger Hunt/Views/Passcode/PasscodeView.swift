//
//  PasscodeView.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct PasscodeView: View {
    
    var result : (Bool) -> ()
    
    @State private var passcode = Passcode()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Spacer()
                    Text(passcode.passcode)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                .frame(height: geometry.size.height / 2)
                NumberPadView()
                    .environment(passcode)
                    .frame(height: geometry.size.height / 2)
            }
        }
        .padding()
        .onChange(of: passcode.passcode) {
            if passcode.passcode.count == 6 && !passcode.passcode.contains("*") {
                passcode.verify { result in
                    self.result(result)
                }
            }
        }
    }
}

#Preview {
    PasscodeView() { _ in }
}
