//
//  CoreHapticsAndNearbyInteractionsView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct CoreHapticsAndNearbyInteractionsView: View {
    
    @Environment(Game.self) private var game
    
    @State private var cardNumber = ""
    @State private var name = ""
    @State private var cvv = ""
    
    @State private var expiryDate = ""
    
    @State private var isErrorPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text("Sean's ")
                Text("Stolen")
                    .background(.tint.opacity(0.2))
                Text(" $oon")
            }
            .font(.title3)
            .fontWeight(.medium)
            
            HStack {
                Text("Found Credit Card")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.tint)
                
                Spacer()
                
                Text(Date.now, style: .date)
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            HStack {
                Text("Card Number:")
                    .fontWeight(.bold)
                
                TextField("Enter Card Number", text: $cardNumber)
                    .keyboardType(.numberPad)
            }
            .frame(maxHeight: .infinity)
            
            Divider()
            
            HStack {
                Text("CVV (Last 3 digits at the back):")
                    .fontWeight(.bold)
                
                TextField("CVV", text: $cvv)
                    .keyboardType(.numberPad)
            }
            .frame(maxHeight: .infinity)
            
            Divider()
            
            HStack {
                Text("Card Holder Name:")
                    .fontWeight(.bold)
                
                TextField("Full Name", text: $name)
            }
            .frame(maxHeight: .infinity)
            
            Divider()
            
            HStack {
                Text("Expiry Date")
                    .fontWeight(.bold)
                
                TextField("MM/YY", text: $expiryDate)
            }
            .frame(maxHeight: .infinity)
            
            Divider()
            
            Button("Submit") {
                let cleanedCardNumber = cardNumber.filter { $0.isNumber }
                
                if cleanedCardNumber == "5683468246265283" && name.lowercased() == "sean wong" && cvv == "491" && expiryDate == "08/24" {
                    game.stationCompleted(.coreHapticsAndNearbyInteractions)
                } else {
                    isErrorPresented.toggle()
                }
            }
            .frame(maxHeight: .infinity)
            .fontWeight(.bold)
            
            ForEach(0..<8) { _ in
                Divider()
                
                Rectangle()
                    .fill(.clear)
            }
        }
        .padding()
        .ignoresSafeArea(.keyboard)
        .alert("Incorrect Information", isPresented: $isErrorPresented) {
            Button("Try Again") {}
        }
    }
}

#Preview {
    CoreHapticsAndNearbyInteractionsView()
}
