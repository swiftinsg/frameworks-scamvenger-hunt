//
//  KeypadKey.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 9/5/24.
//

import Foundation

enum KeypadKey: String {
    case circle, triangle, square,
         pentagon, hexagon, octagon
    
    var symbol: String {
        return "\(self.rawValue).fill"
    }
    
    static func getMapIndexForCombination(_ combination: [KeypadKey]) -> Int? {
        let combinations = [
            [triangle, square, octagon, pentagon],
            [pentagon, square, octagon, pentagon],
            [octagon, circle, pentagon, triangle],
            [triangle, hexagon, triangle, square],
            [pentagon, square, circle, hexagon],
            [octagon, hexagon, circle, triangle],
            [hexagon, circle, circle, square],
            [pentagon, square, octagon, square],
            [hexagon, octagon, hexagon, circle]
        ]
        
        return combinations.firstIndex(of: combination)
        
    }
}
