//
//  Color+Extensions.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 06/05/25.
//

import SwiftUI

// MARK: - Extension Color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)

        let (a, r, g, b): (UInt64, UInt64, UInt64, UInt64) = switch hex.count {
            case 3:  (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6:  (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8:  (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default: (255, 1, 1, 0)
        }

        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}


