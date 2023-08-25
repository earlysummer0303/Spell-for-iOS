//
//  BackgroundView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/23.
//

import SwiftUI

func backgroundGradientView() -> some View {
    VStack {
        Spacer()
        Gradient.bgGradient
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.getHeight(100))
    }
}

func backgroundColorView() -> some View {
    Color.bgColor.ignoresSafeArea()
}
