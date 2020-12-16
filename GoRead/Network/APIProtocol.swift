//
//  APIProtocol.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/11.
//  网络接口，返回模型数据

import Foundation
import RxSwift

protocol APIProtocol {
    
    /// 举例登录接口
    /// - Parameters:
    ///   - path: 拼接路径
    ///   - account: 账号
    ///   - password: 密码
    func login(path: String, account: String, password: String) -> Single<[People]>
}
