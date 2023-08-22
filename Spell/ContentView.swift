//
//  ContentView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMainPageView = false
    
    var body: some View {
        ZStack {
            if showMainPageView {
                MainPageView()
            } else {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                showMainPageView.toggle()
                            }
                        }
                    }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
