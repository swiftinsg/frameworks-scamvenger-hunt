//
//  Group.swift
//  ScamvengerServer
//
//  Created by Jia Chen Yee on 8/30/24.
//

struct Group {
    var name: String
    var number: Int
    
    var currentStation: Station?
    var completedStations: [Station] = []
}
