//
//  TabBarAccessor.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/23.
//

import SwiftUI
import UIKit

struct TapBarAccessor: UIViewControllerRepresentable { // makeUIViewController, updateUIViewController 두가지 함수가 있어야 UIViewControllerRepresentable을 conform
    
    private let proxyController = ProxyViewController() // proxy: 대신하다의 의미. helper 느낌.
    
    var callback: (UITabBar) -> Void = { _ in }
    
    func makeUIViewController(context:
                              UIViewControllerRepresentableContext<TapBarAccessor>) -> UIViewController {
        proxyController.callback = callback
        return proxyController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TapBarAccessor>) {
     
    }
    
    // 탭바를 가져오기 위한 Helper ViewController
    private class ProxyViewController: UIViewController {
        var callback: (UITabBar) -> Void = { _ in }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            if let tabBarController = self.tabBarController {
                //탭바 컨트롤러의 탭바를 클로져로 보냄.
                callback(tabBarController.tabBar)
            }
        }
    }
}

