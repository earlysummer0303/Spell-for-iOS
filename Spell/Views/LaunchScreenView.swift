//
//  LaunchScreenView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/22.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea()
            if isLoading {
                ZStack {
                    Color.bgColor.ignoresSafeArea()
                    VStack {
                        Spacer()
                        Image(.launchScreenGradient)
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: UIScreen.getHeight(504))
                    }
                    .ignoresSafeArea()
                    Image(.textLogo)
                        .resizable()
                        .frame(width: UIScreen.getWidth(111), height: UIScreen.getWidth(48))
                        .padding()
                        .onAppear {
                            
                        }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+1 , execute: {
                withAnimation { isLoading.toggle() }
            })
    }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
