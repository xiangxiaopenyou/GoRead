//
//  HomeTabBarController.swift
//  GoRead
//
//  Created by zhangdu_imac on 2021/1/18.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    var viewModel: HomeTabBarViewModel!
    var navigator: Navigator!
    
    // MARK: Initializer
    init(viewModel: HomeTabBarViewModel, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
