//
//  Hint.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/30/24.
//

import Foundation
import SwiftUI

struct Hint {
    var text: AttributedString?
    var image: Image?
    var imageAlignment: Alignment = .center
}

extension Hint: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self.init(text: try? AttributedString(markdown: value))
    }
}
