//
//  Gradient+.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/22.
//

import SwiftUI

extension Gradient {
    static let lineGradient = LinearGradient(gradient: Gradient(colors: [
        Color(#colorLiteral(red: 0.6666666667, green: 0.662745098, blue: 0.9764705882, alpha: 1)).opacity(0.25), Color(#colorLiteral(red: 0.9294117647, green: 0.7176470588, blue: 0.7647058824, alpha: 1)).opacity(0.25), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.0)
    ]), startPoint: .top, endPoint: .bottom)
    
    static let lineVerticalGradient = LinearGradient(gradient: Gradient(colors: [
        Color(#colorLiteral(red: 0.6666666667, green: 0.662745098, blue: 0.9764705882, alpha: 1)).opacity(0.25), Color(#colorLiteral(red: 0.9294117647, green: 0.7176470588, blue: 0.7647058824, alpha: 1)).opacity(0.25), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.0)
    ]), startPoint: .leading, endPoint: .trailing)
    
    static let ctaGradient = LinearGradient(gradient: Gradient(colors: [
        Color(#colorLiteral(red: 0.9803921569, green: 0.937254902, blue: 0.9333333333, alpha: 1)), Color(#colorLiteral(red: 0.9294117647, green: 0.7176470588, blue: 0.7647058824, alpha: 1)), Color(#colorLiteral(red: 0.5529411765, green: 0.4117647059, blue: 0.8823529412, alpha: 1))
    ]), startPoint: .top, endPoint: .bottom)
    
    static let ctaVerticalGradient = LinearGradient(gradient: Gradient(colors: [
        Color(#colorLiteral(red: 0.9803921569, green: 0.937254902, blue: 0.9333333333, alpha: 1)), Color(#colorLiteral(red: 0.9294117647, green: 0.7176470588, blue: 0.7647058824, alpha: 1)), Color(#colorLiteral(red: 0.5529411765, green: 0.4117647059, blue: 0.8823529412, alpha: 1))
    ]), startPoint: .trailing, endPoint: .leading)
    
    static let whiteGradient = LinearGradient(gradient: Gradient(colors: [
        Color.white.opacity(0.6), Color.white.opacity(0.3)
    ]), startPoint: .top, endPoint: .bottom)
    
    static let bgGradient = LinearGradient(
        stops: [
            Gradient.Stop(color: Color.black.opacity(0), location: 0.00),
            Gradient.Stop(color: Color.black, location: 0.67),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
    )
}
