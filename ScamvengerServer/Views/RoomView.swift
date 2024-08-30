//
//  RoomView.swift
//  ScamvengerServer
//
//  Created by Jia Chen Yee on 8/30/24.
//

import SwiftUI

struct RoomView: View {
    
    var room: RoomInfo?
    var hasBorder = true
    var filled = true
    
    var body: some View {
        Rectangle()
            .fill(.clear)
            .background(.tint.opacity(filled ? 1 : 0))
            .border(.white, width: hasBorder ? 1 : 0)
            .foregroundStyle(.white)
            .overlay {
                if let room {
                    VStack {
                        Text(room.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        HStack {
                            Text("/\(room.capacity)")
                            Image(systemName: "person.3.fill")
                        }
                    }
                }
        }
    }
}
