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
    var groups: [Int: Group] = [:]
    
    var allRequests: [InputRequest] {
        [group1Request, group2Request, group3Request, group4Request, group5Request, group6Request, group7Request, group8Request].compactMap {$0}
    }
    
    var group1Request: InputRequest? = nil
    var group2Request: InputRequest? = nil
    var group3Request: InputRequest? = nil
    var group4Request: InputRequest? = nil
    var group5Request: InputRequest? = nil
    var group6Request: InputRequest? = nil
    var group7Request: InputRequest? = nil
    var group8Request: InputRequest? = nil
    
    init() {
        Task {
            let app = try await Application.make(.detect())
            
            app.get("next", ":number") { req in
                guard let number = req.parameters.get("number"),
                      let group = Int(number) else {
                    return ""
                }
                
                return await self.issueInputRequest(group: group)
            }
            
            app.post("hello", ":number") { req in
                guard let number = req.parameters.get("number"),
                      let group = Int(number),
                      1...8 ~= group,
                      let groupName = req.body.string else {
                    return "error"
                }
                
                self.groups[group] = Group(name: groupName, number: group)
                
                return "hello \(groupName)!"
            }
            
            try await app.execute()
        }
    }
    
    func issueInputRequest(group: Int) async -> String {
        let requestId = UUID()
        
        let newInputRequest = InputRequest(id: requestId,
                                           group: group,
                                           date: .now)
        
        switch group {
        case 1: group1Request = newInputRequest
        case 2: group2Request = newInputRequest
        case 3: group3Request = newInputRequest
        case 4: group4Request = newInputRequest
        case 5: group5Request = newInputRequest
        case 6: group6Request = newInputRequest
        case 7: group7Request = newInputRequest
        case 8: group8Request = newInputRequest
        default: break
        }
        
        await withCheckedContinuation { continuation in
            _ = withObservationTracking {
                switch group {
                case 1: return group1Request
                case 2: return group2Request
                case 3: return group3Request
                case 4: return group4Request
                case 5: return group5Request
                case 6: return group6Request
                case 7: return group7Request
                case 8: return group8Request
                default: return group8Request
                }
            } onChange: {
                
                
                continuation.resume()
            }
        }
        
        print("ending group \(group) connection")
        
        let request: InputRequest? = {
            switch group {
            case 1: return self.group1Request
            case 2: return self.group2Request
            case 3: return self.group3Request
            case 4: return self.group4Request
            case 5: return self.group5Request
            case 6: return self.group6Request
            case 7: return self.group7Request
            case 8: return self.group8Request
            default: return self.group8Request
            }
        }()
        
        let response = request?.response
        
        return response?.rawValue ?? ""
    }
}

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
