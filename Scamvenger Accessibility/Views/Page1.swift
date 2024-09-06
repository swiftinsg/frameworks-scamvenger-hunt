//
//  Page1.swift
//  Scamvenger Accessibility
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct Page1: View {
    var body: some View {
        StyledPage(
            title: "$oon Heist Plan Meeting Minutes - Page 1",
            subtitle: "In Attendance: Sean (spelt S-E-A-N), Shaun (spelt S-H-A-U-N), Shawn (spelt S-H-A-W-N), and Shon (spelt S-H-O-N)",
            date: Date.now.addingTimeInterval(-86400)
        ) {
            List {
                Text("""
                1. Welcome and Introduction
                Sean (S-E-A-N): Welcomed everyone to the final planning meeting of "$oon Heist."
                Shaun (S-H-A-U-N): Verified the security of the meeting room (jammed signals, encrypted network). No one is tracking us.
                Shon (S-H-O-N): Brought snacks (again).
                """)
                
                Text("""
                2. Agenda Overview
                Finalize the $oon Vault break-in strategy.
                Assign individual roles for the heist.
                Discuss exit routes and fallback plans.
                """)
                
                Text("""
                3. Planning Details
                Vault Access:
                Sean (S-E-A-N): Acquired the access code to the $oon vault. Code is 4567, but we have only 5 minutes to enter before it resets.
                Shaun (S-H-A-U-N): Installed a backdoor into the vault's systems. He’ll disable the security cameras for exactly 2 minutes after Sean (S-E-A-N) enters the code.
                Shawn (S-H-A-W-N): Handling the getaway car. License plate: SAP123. We'll have to ditch it within 3 kilometres to avoid tracking.
                Shon (S-H-O-N): Distraction is planned at Apple Developer Center during the heist. He’ll stage a fake protest about "free $oon rights" to pull security away.
                """)
                
                Text("""
                4. Roles Assigned
                Sean (S-E-A-N): Lead the break-in, handle the code input.
                Shaun (S-H-A-U-N): Manage tech operations remotely, keep cameras offline.
                Shawn (S-H-A-W-N): Logistics, getaway driver.
                Shon (S-H-O-N): Lead distraction efforts at Apple Developer Center.
                """)
                
                Text("""
                5. Key Timings
                All: Meet at Innovis Lobby at 6:50 AM.
                Shaun (S-H-A-U-N): Must hack into the system exactly at 7:00 AM.
                Sean (S-E-A-N): Enter vault code by 7:03 AM sharp.
                All: We must leave the vault by 7:05 AM latest to avoid detection.
                Shawn (S-H-A-W-N): Arrives with the car behind Innovis by 7:10 AM.
                """)
            }
            .scrollDisabled(true)
            .listStyle(.plain)
        }
    }
}

