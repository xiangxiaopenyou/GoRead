//
//  ViewController.swift
//  GoRead
//
//  Created by zhangdu_imac on 2021/1/21.
//  所有视图控制器基类

import UIKit

class ViewController: UIViewController, Navigatable {
    
    var navigator: Navigator!
    var viewModel: ViewModel?
    
    // MARK: Initializer
    init(viewModel: ViewModel?, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
