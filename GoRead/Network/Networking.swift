//
//  Networking.swift
//  GoRead
//
//  Created by zhangdu_imac on 2021/1/23.
//

import Foundation
import Moya
import Alamofire
import RxSwift

class NetworkingProvider<Target> where Target: Moya.TargetType {
    /// 网络状态
    fileprivate let isNetworkReachable: Observable<Bool>
    fileprivate let provider: MoyaProvider<Target>
    
    /// 初始化
    init(provider: MoyaProvider<Target> = MoyaProvider<Target>(), isNetworkReachable: Observable<Bool> = networkReachable()) {
        self.isNetworkReachable = isNetworkReachable
        self.provider = provider
    }
    /// 请求方法
    func request(target: Target) -> Observable<Moya.Response> {
        let resultRequest = provider.rx.request(target)
    }
}

/// 网络服务协议
protocol NetworkingProtocol {
    associatedtype Target: TargetType
    var provider: NetworkingProvider<Target> { get }

    /// 普通网络请求
    static func commonNetworking() -> Self
    /// 特殊网络请求
    static func othersNetworking() -> Self
}


/// 用户相关网络服务结构体
//struct UserAPINetworking {
//    let provider: UserAPI
//
//    typealias Target = UserAPI
//
//    let provider: NetworkingProvider<Target>
//
//    static func commonNetworking() -> UserAPINetworking {
//
//    }
//
//    static func othersNetworking() -> UserAPINetworking {
//
//    }
//
//}
