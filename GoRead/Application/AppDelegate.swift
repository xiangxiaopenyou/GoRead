//
//  AppDelegate.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/2.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var shared: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    var window: UIWindow?
    let navigator = Navigator.default
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.makeKeyAndVisible()
        let tabBarViewModel = HomeTabBarViewModel()
        navigator.show(sender: nil, scene: .tab(viewModel: tabBarViewModel), transition: .root(window: window!))
        
        let networking = Networking()
        networking.test(classId: "1")
        
        return true
    }
}

