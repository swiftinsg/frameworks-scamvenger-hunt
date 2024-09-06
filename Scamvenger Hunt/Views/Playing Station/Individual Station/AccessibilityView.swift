//
//  AccessibilityView.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct AccessibilityView: View {
    
    @Environment(Game.self) private var game
    
    @State private var suspectName = ""
    @State private var secureMeetingMethod1 = ""
    @State private var secureMeetingMethod2 = ""
    @State private var code = ""
    @State private var plate = ""
    @State private var distractorsName = ""
    @State private var heistDuration = ""
    @State private var dropOffLocation = ""
    @State private var luringJiaChenAway = ""
    @State private var drillPracticeDate = Date()
    
    @State private var isErrorPresented = false
    
    private var correct: Bool {
        if suspectName.lowercased() == "shawn" &&
            (secureMeetingMethod1.lowercased() == "jam" || secureMeetingMethod1.lowercased() == "jammed") &&
            (secureMeetingMethod2.lowercased() == "encrypt" || secureMeetingMethod2.lowercased() == "encrypted") &&
            code.lowercased() == "4567" &&
            plate.lowercased() == "sap123" &&
            distractorsName.lowercased() == "shon" &&
            heistDuration.lowercased() == "20" &&
            dropOffLocation.lowercased() == "changi airport" &&
            luringJiaChenAway.lowercased() == "hot chocolate" &&
            drillPracticeDate == Date.init(timeIntervalSince1970: TimeInterval(1725631200)) {
            return true
        } else {
            return false
        }
    }
    
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
                Text("Sneaky Schemer’s Secretive Screen Search")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.tint)
                
                Spacer()
                
                Text(Date.now, style: .date)
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            List {
                HStack(spacing: 0) {
                    Text("Names of Suspects: ")
                        .fontWeight(.bold)
                    Text("Sean, Shaun, ")
                    TextField("XXXXX", text: $suspectName)
                        .fixedSize()
                        .foregroundStyle(Color.accentColor)
                    Text(", and Shon.")
                }
                HStack(spacing: 0) {
                    Text("Methods to secure their meeting room: ")
                        .fontWeight(.bold)
                    TextField("XXXXXX", text: $secureMeetingMethod1)
                        .fixedSize()
                        .foregroundStyle(Color.accentColor)
                    Text(" signals and ")
                    TextField("XXXXXXXXX", text: $secureMeetingMethod2)
                        .fixedSize()
                        .foregroundStyle(Color.accentColor)
                    Text(" network.")
                }
                HStack(spacing: 0) {
                    Text("Code to the $oon vault: ")
                        .fontWeight(.bold)
                    TextField("0000", text: $code)
                        .fixedSize()
                        .foregroundStyle(Color.accentColor)
                        .keyboardType(.numberPad)
                    Text(".")
                }
                HStack(spacing: 0) {
                    Text("Getaway car's license plate: ")
                        .fontWeight(.bold)
                    TextField("XXXXXX", text: $plate)
                        .fixedSize()
                        .foregroundStyle(Color.accentColor)
                    Text(" .")
                }
                HStack(spacing: 0) {
                    Text("Distraction: ")
                        .fontWeight(.bold)
                    TextField("XXXXX", text: $distractorsName)
                        .fixedSize()
                        .foregroundStyle(Color.accentColor)
                    Text(" will be at Apple Developer Center staging a fake protest.")
                }
                HStack(spacing: 0) {
                    Text("Total duration of heist (from meetup to getaway): ")
                        .fontWeight(.bold)
                    TextField("00", text: $heistDuration)
                        .fixedSize()
                        .foregroundStyle(Color.accentColor)
                        .keyboardType(.numberPad)
                    Text(".")
                }
                HStack(spacing: 0) {
                    Text("Drop-off location: ")
                        .fontWeight(.bold)
                    TextField("XXXXXXXXXXXXXX", text: $dropOffLocation)
                        .fixedSize()
                        .foregroundStyle(Color.accentColor)
                    Text(" drop-off point.")
                }
                HStack(spacing: 0) {
                    Text("Plan to lure Jia Chen away: ")
                        .fontWeight(.bold)
                    Text("Lure him away with ")
                    TextField("XXXXXXXXXXXXX", text: $luringJiaChenAway)
                        .fixedSize()
                        .foregroundStyle(Color.accentColor)
                    Text(".")
                }
                HStack(spacing: 0) {
                    Text("Final drill practice date:")
                        .fontWeight(.bold)
                    DatePicker("", selection: $drillPracticeDate, displayedComponents: [.date, .hourAndMinute])
                        .fixedSize()
                        .tint(Color.accentColor)
                }
                Button("Submit") {
                    if correct {
                        game.stationCompleted(.accessibility)
                    } else {
                        isErrorPresented = true
                    }
                }
                .foregroundStyle(Color.accentColor)
            }
            .listStyle(.plain)
        }
        .padding()
        .alert("Incorrect Information", isPresented: $isErrorPresented) {
            Button("Try Again") {}
        }
    }
}

#Preview {
    AccessibilityView()
}
