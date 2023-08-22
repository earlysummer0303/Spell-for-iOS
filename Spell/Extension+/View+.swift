//
//  View+.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/23.
//

import SwiftUI

// TabBarAccessor를 사용해서 탭바 숨기기 -> View에 적용하기.

extension View {
    func setTabBarVisibility(isHidden: Bool) -> some View {
        background(TapBarAccessor(callback: { tabBar in
            tabBar.isHidden = true
        }))
    }
}
