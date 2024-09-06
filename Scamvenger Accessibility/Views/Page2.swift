//
//  Page2.swift
//  Scamvenger Accessibility
//
//  Created by Tristan Chay on 6/9/24.
//

import SwiftUI

struct Page2: View {
    var body: some View {
        StyledPage(
            title: "$oon Heist Meeting Minutes - Page 2",
            subtitle: "In Attendance: Sean (spelt S-E-A-N), Shaun (spelt S-H-A-U-N), Shawn (spelt S-H-A-W-N), and Shon (spelt S-H-O-N)",
            date: Date.now.addingTimeInterval(-86400)
        ) {
            List {
                Text("""
                6. Exit Strategy
                Shawn (S-H-A-W-N) drives the group to the drop-off point at Changi Airport.
                All $oon retrieved will be split 4 ways. No exceptions.
                """)
                
                Text("""
                7. Contingencies
                If the alarm is triggered, Shaun (S-H-A-U-N) will set off a diversion through the system to fake a fire alarm in the neighboring building.
                Shon (S-H-O-N) will delay security for as long as possible.
                If Jia Chen arrives early, Shaun (S-H-A-U-N) will be in charge of luring him away with Hot Chocolate
                """)
                
                Text("""
                8. Final Words
                Sean (S-E-A-N): “Remember, we’ve been planning this for weeks. Stick to the plan, follow the timings, and no funny business. The $oon will be ours!”
                """)
                
                Text("""
                9. Next Steps
                Final practice drill tonight at 10:00 PM.
                """)
            }
            .scrollDisabled(true)
            .listStyle(.plain)
        }
    }
}
#Preview {
    Page2()
}
