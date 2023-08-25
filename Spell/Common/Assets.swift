//
//  Assets.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/22.
//

import SwiftUI

extension Image {
    enum ImageAssetName: String {
        case launchScreenGradient
        case textLogo
        case crystalBall_0, crystalBall_1, crystalBall_2, crystalBall_3, crystalBall_4
        case test
        case noSpellYet
        case mainTab
        case myTab
        case mainTabDisabled
        case myTabDisabled
        case tabBarShape
        case plusGradientButton
        case trashBin
    }
    init(_ name: ImageAssetName){
        self.init(name.rawValue)
    }
}


