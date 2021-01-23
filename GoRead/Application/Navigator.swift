//
//  Navigator.swift
//  GoRead
//
//  Created by zhangdu_imac on 2021/1/18.
//  视图导航工具

import Foundation
import UIKit

protocol Navigatable {
    var navigator: Navigator! { get set }
}

class Navigator {
    
    static var `default` = Navigator()
    
    /// 所以视图场景
    enum Scene {
        case tab(viewModel: HomeTabBarViewModel)
    }
    
    /// 转场方式
    enum Transition {
        case root(window: UIWindow)     // 设置Window的rootViewControler
        case push(animated: Bool)
        case modal(animated: Bool)
        case detail
        case alert
    }
    
    
    /// 获取视图控制器
    /// - Parameter scene: 场景
    /// - Returns: 控制器
    func controller(scene: Scene) -> UIViewController? {
        switch scene {
        case .tab(let viewModel):
            let tabBarController = HomeTabBarController(viewModel: viewModel, navigator: self)
            return tabBarController
        }
    }
    
    /// 处理不同转场
    /// - Parameters:
    ///   - sender: 视图控制器
    ///   - scene: 目标场景
    ///   - transition: 转场方式
    func show(sender: UIViewController?, scene: Scene, transition: Transition = .push(animated: true)) {
        if let target = controller(scene: scene) {
            switch transition {
            case .root(window: let window):
                UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft) {
                    window.rootViewController = target
                } completion: { (finished) in
                }
                return
            default: break
            }
            
            // 判空
            guard let sender = sender else {
                fatalError("push视图控制器错误")
            }
            
            switch transition {
            case .push(animated: let animated):
                if let navigationController = sender as? UINavigationController {
                    navigationController.pushViewController(target, animated: animated)
                    return
                }
                if let navigationController = sender.navigationController {
                    navigationController.pushViewController(target, animated: animated)
                }
            case .modal(animated: let animated):
                DispatchQueue.main.async {
                    let navigationController = NavigationController(rootViewController: target)
                    sender.present(navigationController, animated: animated, completion: nil)
                }
            case .detail:
                DispatchQueue.main.async {
                    let navigationController = NavigationController(rootViewController: target)
                    sender.showDetailViewController(navigationController, sender: nil)
                }
            case .alert:
                DispatchQueue.main.async {
                    sender.present(target, animated: true, completion: nil)
                }
            default: break
            }
        }
    }
        
    /// pop
    /// - Parameters:
    ///   - sender: 视图控制器
    ///   - popToRoot: 是否pop到根视图
    func pop(sender: UIViewController, popToRoot: Bool = false) {
        if popToRoot {
            sender.navigationController?.popToRootViewController(animated: true)
        } else {
            sender.navigationController?.popViewController(animated: true)
        }
    }
    
    /// dimiss
    /// - Parameter sender: 视图控制器
    func dismiss(sender: UIViewController) {
        sender.dismiss(animated: true, completion: nil)
    }
}
