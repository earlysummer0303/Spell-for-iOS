//
//  SpellModel.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/28.
//

import SwiftUI

struct Spell: Codable {
    let message: String
    let isDefault: Bool
    var isSelected: Bool
}
