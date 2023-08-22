//
//  ContentView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showRootView = false
    
    var body: some View {
        ZStack {
            if showRootView {
                RootTabView()
            } else {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                showRootView.toggle()
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
