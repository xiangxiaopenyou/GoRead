//
//  ViewModel.swift
//  GoRead
//
//  Created by zhangdu_imac on 2021/1/18.
//

import UIKit


/// ViewModel协议
protocol ViewModelProtocal {
    // 数据输入
    associatedtype Input
    // 数据输出
    associatedtype Output
    
    // 数据转换方法
    func transform(input: Input) -> Output
}

class ViewModel: NSObject {
    
}
