//
//  Passcode.swift
//  Scamvenger Hunt
//
//  Created by Tristan Chay on 7/9/24.
//

import Foundation
import Observation

@Observable
class Passcode {
    
    var passcode = "******"
    
    func addValue(value: String) {
        if passcode.replacingOccurrences(of: "*", with: "").count < 6 {
            passcode = passcode.replacingOccurrences(of: "*", with: "") + value
            addAsterisks()
        }
    }
    
    func delete() {
        if passcode.count > 0 {
            passcode = String(passcode.replacingOccurrences(of: "*", with: "").dropLast())
            addAsterisks()
        }
    }
    
    func verify(_ completion: @escaping (Bool) -> ()) {
        if passcode == "138634" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
                completion(true)
            }
        } else {
            completion(false)
        }
    }
    
    private func addAsterisks() {
        for _ in 0..<(6-passcode.count) {
            passcode += "*"
        }
    }
}
