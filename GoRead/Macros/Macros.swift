//
//  Macros.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/15.
//

import Foundation

struct Macros {
    
    // MARK: 网络接口URL
    struct NetworkURL {
        #if DEBUG
        static let baseURL = "http://testapp.zhangdu.com/v1"
        #else
        static let baseURL = ""
        #endif
    }
    
    // MARK: 沙盒路径
    struct DirectoryPath {
        static let doucumentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        
        static let cachesPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        
        static let tempPath = NSTemporaryDirectory()
        
    }
}
