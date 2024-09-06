//
//  ContentView.swift
//  Scamvenger Accessibility
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Page1()
            Page2()
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .blur(radius: 5)
    }
}
