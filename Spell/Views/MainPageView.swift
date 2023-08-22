//
//  MainPageView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/22.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    Text("Do your spells")
                        .h1Font()
                        .foregroundColor(.white)
                    Image(.crystalBall_0)
                        .resizable()
                        .frame(width: UIScreen.getWidth(390), height: UIScreen.getWidth(390))
                        .padding(.top, UIScreen.getHeight(36))
                    HStack {
                        Text("Today's spells")
                            .h3Font()
                        .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal, UIScreen.getWidth(20))
                    .padding(.top, UIScreen.getHeight(64))
                    Image(.noSpellYet)
                        .padding(.top, UIScreen.getHeight(65))
                    Text("No spells yet")
                        .b1Font()
                        .foregroundColor(.g3Color)
                        .padding(.top, UIScreen.getHeight(30))
                }
                .padding(.top, UIScreen.getHeight(98))
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
