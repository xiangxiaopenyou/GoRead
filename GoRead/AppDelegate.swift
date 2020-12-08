//
//  AppDelegate.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/2.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController.init(rootViewController: ViewController.init())
        window?.rootViewController = navigationController
        return true
    }

}

