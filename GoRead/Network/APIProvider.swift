//
//  APIProvider.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/14.
//

import RxSwift
import Moya
import Alamofire

class APIProvider {
    // 真正请求对象
    let provider: MoyaProvider<NetworkingAPI>
    init() {
        // 初始化 MoyaProvider
        self.provider = MoyaProvider<NetworkingAPI>()
    }
//    func request(_ target: NetworkingAPI) -> Observable<Moya.Response> {
//        self.provider.request(<#T##target: NetworkingAPI##NetworkingAPI#>, callbackQueue: <#T##DispatchQueue?#>, progress: <#T##ProgressBlock?##ProgressBlock?##(ProgressResponse) -> Void#>, completion: <#T##Completion##Completion##(Result<Response, MoyaError>) -> Void#>)
//    }
}

// MARK: 实现APIProtocol协议
//extension APIProvider: APIProtocol {
//    func login(path: String, account: String, password: String) -> Single<[People]> {
//
//    }
//}
