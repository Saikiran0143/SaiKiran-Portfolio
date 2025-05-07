//
//  Font+Extensions.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 08/05/25.
//

import SwiftUI

extension Font {
    
    static func robotoRegular(size: CGFloat) -> Font {
        return Font.custom("Roboto-Regular", size: size)
    }
    
    static func robotoBold(size: CGFloat) -> Font {
        return Font.custom("Roboto-Bold", size: size)
    }
    
    static func robotoMedium(size: CGFloat) -> Font {
        return Font.custom("Roboto-Medium", size: size)
    }
    
    static func robotoBoldItalic(size: CGFloat) -> Font {
        return Font.custom("Roboto-BoldItalic", size: size)
    }
    
    static func pallyVariable(size: CGFloat) -> Font {
        return Font.custom("Pally Variable", size: size)
    }

    static func proximaNovaBold(size: CGFloat) -> Font {
        return Font.custom("ProximaNova-Bold", size: size)
    }
    
    static func proximaNovaSemibold(size: CGFloat) -> Font {
        return Font.custom("ProximaNova-Semibold", size: size)
    }
    
    static func proximaNovaRegular(size: CGFloat) -> Font {
        return Font.custom("ProximaNova-Regular", size: size)
    }
    
    static func drAguRegular(size: CGFloat) -> Font {
        return Font.custom("dr_agu_regular", size: size)
    }
}
