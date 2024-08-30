//
//  Communication.swift
//  ScamvengerServer
//
//  Created by Jia Chen Yee on 8/30/24.
//

import Foundation
import Observation
import Vapor

@Observable
class Communication {
    init() {
        Task {
            let app = try await Application.make(.detect())
            
            app.get("hello") { req in
                "Hello, world!"
            }
            
            try await app.execute()
        }
    }
}
