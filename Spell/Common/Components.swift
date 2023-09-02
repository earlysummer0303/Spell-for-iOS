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
                isDisabled ? Gradient.ctaVerticalGradientDisabled : Gradient.ctaVerticalGradient
            )
            .frame(height: 56)
            .overlay(
                Text(title)
                    .foregroundColor(.bgColor)
                    .b1Font()
            )
    }
}

func navigationBackButtonHeaderLabel() -> some View {
    HStack {
        Image(systemName: "chevron.left")
            .foregroundColor(.white)
            .font(.system(size: UIScreen.getWidth(24), weight: .medium))
        Spacer()
    }
    .padding(.horizontal, 20)
    .padding(.top, 12)
    .padding(.bottom, 17)
}
