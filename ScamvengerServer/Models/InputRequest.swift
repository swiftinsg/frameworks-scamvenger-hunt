//
//  InputRequest.swift
//  ScamvengerServer
//
//  Created by Jia Chen Yee on 8/30/24.
//

import Foundation

struct InputRequest: Identifiable {
    var id: UUID
    var group: Int
    var date: Date
    
    var response: Station?
}
