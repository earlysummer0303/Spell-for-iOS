//
//  SpellApp.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/22.
//

import SwiftUI

@main
struct SpellApp: App {
    
    //뷰모델의 instance를 여기에서 생성해주고, environmentObject로서 모든 뷰에서 참조 가능하게 한다.
    @StateObject var selectSpellViewModel = SelectSpellViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(selectSpellViewModel)
        }
    }
}
