//
//  RoomInfo.swift
//  ScamvengerServer
//
//  Created by Jia Chen Yee on 8/30/24.
//

import Foundation

struct RoomInfo {
    let name: String
    let capacity: Int
    let station: Station
    
    static let newton = RoomInfo(name: "Newton", capacity: 1, station: .coreHapticsAndNearbyInteractions)
    static let dhobyGhaut = RoomInfo(name: "Dhoby Ghaut", capacity: 3, station: .mapKit)
    static let toaPayoh = RoomInfo(name: "Toa Payoh", capacity: 2, station: .userNotificationsAndWidgetKit)
    static let somerset = RoomInfo(name: "Somerset", capacity: 4, station: .spriteKitAndCoreMotion)
    static let orchard = RoomInfo(name: "Orchard", capacity: 2, station: .accessibility)
    static let pantry = RoomInfo(name: "Pantry", capacity: 3, station: .arKit)
    static let braddell = RoomInfo(name: "Braddell", capacity: 3, station: .pencilKit)
}
