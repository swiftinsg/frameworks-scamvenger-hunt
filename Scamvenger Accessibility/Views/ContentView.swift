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
            Meeting1()
            Text("This is Page 2")
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}
