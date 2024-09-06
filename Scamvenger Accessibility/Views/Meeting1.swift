//
//  Meeting1.swift
//  Scamvenger Accessibility
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct Meeting1: View {
    var body: some View {
        StyledPage(
            title: "$oon Heist Plan - Minutes",
            subtitle: "In Attendance: Sean (spelt S-E-A-N), Shaun (spelt S-H-A-U-N), Shawn (spelt S-H-A-W-N), and Shon (spelt S-H-O-N)",
            date: Date.now.addingTimeInterval(-86400 * 2)
        ) {
            List {
                Text("""
                1. Welcome and Introduction
                Sean (with an E): Welcomed everyone to the second last planning meeting of "$oon Heist."
                Shaun (with a U): Verified the security of the meeting room (jammed signals, encrypted network). No one is tracking us.
                Shon (with an O): Brought snacks (again).
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
                Sean (with an E): Acquired the access code to the $oon vault. Code is 4567, but we have only 5 minutes to enter before it resets.
                Shaun (with a U): Installed a backdoor into the vault's systems. He’ll disable the security cameras for exactly 2 minutes after Sean (with an E) enters the code.
                Shawn (with a W): Handling the getaway car. License plate: SAP123. We'll have to ditch it within 3 kilometres to avoid tracking.
                Shon (with an O): Distraction is planned at Apple Developer Center during the heist. He’ll stage a fake protest about "free $oon rights" to pull security away.
                """)
                
                Text("""
                4. Roles Assigned
                Sean (with an E): Lead the break-in, handle the code input.
                Shaun (with a U): Manage tech operations remotely, keep cameras offline.
                Shawn (with a W): Logistics, getaway driver.
                Shon (with an O): Lead distraction efforts at Apple Developer Center.
                """)
                
                Text("""
                5. Key Timings
                Shaun (with a U): Must hack into the system exactly at 7:00 AM.
                Sean (with an E): Enter vault code by 7:03 AM sharp.
                All: We must leave the vault by 7:05 AM latest to avoid detection.
                Shawn (with a W): Arrives with the car behind Innovis by 7:10 AM.
                """)
                
                Text("""
                6. Exit Strategy
                Shawn (with a W) drives the group to the drop-off point at Changi Airport.
                All $oon retrieved will be split 4 ways. No exceptions.
                """)
                
                Text("""
                7. Contingencies
                If the alarm is triggered, Shaun (with a U) will set off a diversion through the system to fake a fire alarm in the neighboring building.
                Shon (with an O) will delay security for as long as possible.
                If Jia Chen arrives early, Shaun (with a U) will be in charge of luring him away with Hot Chocolate
                """)
                
                Text("""
                8. Final Words
                Sean (with an E): “Remember, we’ve been planning this for weeks. Stick to the plan, follow the timings, and no funny business. The $oon will be ours!”
                """)
                
                Text("""
                 9. Next Steps
                 Final practice drill tonight at 10:00 PM.
                """)
            }
            .listStyle(.plain)
        }
    }
}

