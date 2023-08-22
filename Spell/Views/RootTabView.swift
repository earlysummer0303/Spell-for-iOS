//
//  RootTabView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/23.
//

import SwiftUI

enum TabBarTags {
    case mainPage, myPage
}

struct RootTabView: View {
    @State private var currentTab = TabBarTags.mainPage
    
    var body: some View {
        ZStack {
            TabView(selection: $currentTab) {
                MainPageView()
                    .tag(TabBarTags.mainPage)
                    .setTabBarVisibility(isHidden: true)
                MypageView()
                    .tag(TabBarTags.myPage)
            }
            tabBarAndButton
        }
    }
    
    private var tabBarAndButton: some View {
        VStack {
            Spacer()
            ZStack { // Button + TabBar
                customTabBar
            }
        }
    }
    
    private var customTabBar: some View {
        ZStack { // TabBar 버튼들 + Shape
            Image(.tabBarShape)
                .frame(width: UIScreen.getWidth(277), height: UIScreen.getWidth(62))
            HStack() {
                RoundedRectangle(cornerRadius: 31)
                    .fill(Color.clear)
                    .frame(width: UIScreen.getWidth(101), height: UIScreen.getWidth(62))
                    .overlay (
                        Image(currentTab == .mainPage ? .mainTab : .mainTabDisabled)
                            .frame(width: UIScreen.getWidth(30), height: UIScreen.getWidth(30))
                    )
                    .onTapGesture {
                        currentTab = .mainPage
                    }
                Spacer()
                RoundedRectangle(cornerRadius: 31)
                    .fill(Color.clear)
                    .frame(width: UIScreen.getWidth(101), height: UIScreen.getWidth(62))
                    .overlay (
                        Image(currentTab == .myPage ? .myTab : .myTabDisabled)
                            .frame(width: UIScreen.getWidth(30), height: UIScreen.getWidth(30))
                    )
                    .onTapGesture {
                        currentTab = .myPage
                    }
            }
            .frame(width: UIScreen.getWidth(277))
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
