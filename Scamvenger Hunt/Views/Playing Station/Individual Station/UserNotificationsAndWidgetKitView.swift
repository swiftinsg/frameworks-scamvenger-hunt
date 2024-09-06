//
//  UserNotificationsAndWidgetKitView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct UserNotificationsAndWidgetKitView: View {
    
    @Environment(Game.self) private var game
    
    @State private var favouriteEmoji = ""
    @State private var numberOfAccounts = 0
    @State private var catSays = ""
    
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
                Text("Gather Information From Sean's iPad")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.tint)
                
                Spacer()
                
                Text(Date.now, style: .date)
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            List {
                HStack {
                    Text("Sean's Favourite Emoji:")
                        .fontWeight(.bold)
                    
                    TextField("Enter Sean's Favourite Emoji", text: $favouriteEmoji)
                }
                .frame(maxHeight: .infinity)
                
                HStack {
                    Text("Number of Bank Accounts Sean owns:")
                        .fontWeight(.bold)
                    
                    Stepper("\(numberOfAccounts)", value: .init(
                        get: { numberOfAccounts },
                        set: {
                            if $0 >= 0 {
                                numberOfAccounts = $0
                            }
                        }
                    ))
                    .padding(.leading, 5)
                }
                .frame(maxHeight: .infinity)
                
                HStack {
                    Text("What does the Cat say?")
                        .fontWeight(.bold)
                    
                    TextField("Enter what Pommy Cat says", text: $catSays)
                }
                .frame(maxHeight: .infinity)
                
                Button("Submit") {
                    if catSays.lowercased() == "hallo" && favouriteEmoji == "🧌" && numberOfAccounts == 4 {
                        game.stationCompleted(.userNotificationsAndWidgetKit)
                    } else {
                        isErrorPresented.toggle()
                    }
                }
                .foregroundStyle(Color.accentColor)
                .frame(maxHeight: .infinity)
                .fontWeight(.bold)
            }
            .listStyle(.plain)
        }
        .padding()
        .ignoresSafeArea(.keyboard)
        .alert("Incorrect Information", isPresented: $isErrorPresented) {
            Button("Try Again") {}
        }
    }
}

#Preview {
    UserNotificationsAndWidgetKitView()
}
