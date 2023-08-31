//
//  MainPageView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/22.
//

import SwiftUI


struct MainPageView: View {
    
    @EnvironmentObject var vm: SelectSpellViewModel
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    Text("Do your spells")
                        .h1Font()
                        .foregroundColor(.white)
                    Image(returnCrystalBallImageName())
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
                    if vm.finalSelectedSpellList.isEmpty {
                        noFinalSpellView()
                    } else {
                        finalSpellView()
                    }
                }
                .padding(.top, UIScreen.getHeight(98))
            }
            backgroundGradientView()
        }
        .onAppear {
            vm.getFinalList()
        }
    }
    
    private func noFinalSpellView() -> some View {
        VStack(spacing: 0) {
            Image(.noSpellYet)
                .padding(.top, UIScreen.getHeight(65))
            Text("No spells yet")
                .b1Font()
                .foregroundColor(.g3Color)
                .padding(.top, UIScreen.getHeight(30))
            NavigationLink(destination: {
                SelectSpellView()
            }, label: {
                Capsule()
                    .fill(Gradient.ctaVerticalGradient)
                    .frame(width: 148, height: 40)
                    .overlay(
                        Capsule()
                            .stroke(Gradient.whiteGradient, lineWidth: 1.5)
                            .frame(width: 148, height: 40)
                    )
                    .overlay(
                        Text("Sellect spells")
                            .foregroundColor(.bgColor)
                            .b2Font()
                    )
                
            })
            .padding(.top, 34)
            .padding(.bottom, 140)
        }
    }
    private func finalSpellView() -> some View {
        //        List {
        //            ForEach(vm.finalSelectedSpellList, id: \.self) { spell in
        //                Text(spell)
        //                    .foregroundColor(.g3Color)
        //            }
        //        }
        //        .listStyle(.plain)
        VStack(alignment: .leading, spacing: 0) {
            ForEach(vm.finalSelectedSpellList, id: \.self) { spell in
                Text(spell)
                    .cap3Font()
                    .foregroundColor(.g3Color)
                    .padding(.bottom, 20)
                if spell == vm.finalSelectedSpellList[vm.finalSelectedSpellList.count-1] {
                    
                } else {
                    Rectangle()
                        .fill(Color.g1Color)
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.bottom, 20)
                }
            }
            NavigationLink(destination: {
                SelectSpellView()
            }, label: {
                Rectangle()
                    .fill(Color.clear)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .overlay {
                        HStack {
                            Image(.editIcon)
                                .resizable()
                                .frame(width: UIScreen.getWidth(18), height: UIScreen.getWidth(18))
                            Text("Edit spells")
                                .b2Font()
                                .foregroundColor(.white)
                        }
                    }
            })
        }
        .padding(.horizontal, 20)
        .padding(.top, 34)
        .padding(.bottom, 96)
    }
    
    private func returnCrystalBallImageName() -> Image.ImageAssetName {
        switch vm.finalSelectedSpellList.count {
        case 0 :
            return .crystalBall_0
        case 1 :
            return .crystalBall_1
        case 2 :
            return .crystalBall_2
        case 3 :
            return .crystalBall_3
        case 4 :
            return .crystalBall_4
        case 5 :
            return .crystalBall_5
        default :
            return .crystalBall_0
        }
    }
    
}
    
struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
