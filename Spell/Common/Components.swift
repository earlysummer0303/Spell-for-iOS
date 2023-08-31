//
//  Components.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/27.
//

import SwiftUI

func ctaGradientButton(title: String, action: @escaping ()->Void, isDisabled: Bool = false) -> some View {
    Button(action: action){
        RoundedRectangle(cornerRadius: 20)
            .fill(
                isDisabled ? Gradient.lineVerticalGradient : Gradient.ctaVerticalGradient
            )
            .frame(height: 56)
            .overlay(
                Text(title)
                    .foregroundColor(isDisabled ? .g3Color : .bgColor)
                    .b1Font()
            )
    }
}
