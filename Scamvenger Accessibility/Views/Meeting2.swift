//
//  Meeting2.swift
//  Scamvenger Accessibility
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct Meeting2: View {
    var body: some View {
        StyledPage(
            title: "$oon Heist Plan - Minutes",
            subtitle: "In Attendance: Sean (spelt S-E-A-N), Shaun (spelt S-H-A-U-N), Shawn (spelt S-H-A-W-N), and Shon (spelt S-H-O-N)",
            date: Date.now.addingTimeInterval(-86400 * 2)
        ) {
            List {
                Text("Reach 2 Fusionopolis Way the following day at 7am")
                Text("Break in to Level 3")
                Text("Steal $oon from the secret $oon vault")
                Text("?????")
                Text("Profit!")
                Text("$oon should be kept somewhere safe (will be discussed in a future meeting)")
                Text("Contingency plan:")
                Text("Should a fire break out: Stop, Drop, and Roll")
                Text("If Jia Chen arrives early, Shaun (with a U) will be at the lobby to lure him away with Hot Chocolate")
                Text("Exit strategy: Shon (with an O) will be in the getaway car")
            }
            .listStyle(.plain)
        }
    }
}

