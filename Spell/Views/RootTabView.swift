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
        NavigationStack {
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
    }
    
    private var tabBarAndButton: some View {
        VStack {
            Spacer()
            ZStack(alignment: .top) { // Button + TabBar
                VStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: UIScreen.getWidth(277), height: UIScreen.getHeight(10))
                    customTabBar
                }
                Button(action: {
                    
                }){
                    Image(.plusGradientButton)
                        .resizable()
                        .frame(width: UIScreen.getHeight(53), height: UIScreen.getHeight(53))
                }
            }
        }
    }
    
    private var customTabBar: some View {
        ZStack(alignment: .leading) { // TabBar 버튼들 + Shape
            Image(.tabBarShape)
                .resizable()
                .frame(width: UIScreen.getWidth(277), height: UIScreen.getWidth(62))
            HStack() {
                RoundedRectangle(cornerRadius: 31)
                    .fill(Color.clear)
                    .frame(width: UIScreen.getWidth(101), height: UIScreen.getWidth(62))
                    .overlay (
                        Image(currentTab == .mainPage ? .mainTab : .mainTabDisabled)
                            .resizable()
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
                            .resizable()
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
