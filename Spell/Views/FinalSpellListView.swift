//
//  FinalSpellListView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/29.
//

import SwiftUI

struct FinalSpellListView: View {
    
    @EnvironmentObject var vm: SelectSpellViewModel
    
    var body: some View {
        ZStack{
            Color.bgColor.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                ForEach(vm.finalSelectedSpellList, id: \.self) { spell in
                    Text(spell)
                        .cap3Font()
                        .foregroundColor(.g3Color)
                        .padding(.bottom, 40)
                }
            }
        }
    }
}

struct FinalSpellListView_Previews: PreviewProvider {
    static var previews: some View {
        FinalSpellListView()
    }
}
