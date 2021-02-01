//
//  Networking.swift
//  GoRead
//
//  Created by zhangdu_imac on 2021/1/28.
//

import Foundation
import Moya
import Moya_ObjectMapper
import ObjectMapper
import RxCocoa
import RxSwift
import Alamofire

class Networking: APIProtocol {
    
    /// 网络状态
    fileprivate let isNetworkReachable: Observable<Bool>
    /// UserAPI
    private let provider: MoyaProvider<NetworkAPI>
    
    init() {
        self.isNetworkReachable = networkReachable()
        self.provider = MoyaProvider<NetworkAPI>()
    }
    
//    func request(token: NetworkAPI) -> Observable<Moya.Response> {
//        provider.rx.request(token).subscribe { (response) in
//        } onError: { (error) in
//        }
//    }
}


extension Networking {
    // MARK: APIProtocol
    func test(classId: String) -> Single<[Category]> {
        let result = requestArray(target: .test(classId: classId), type: Category.self)
        return result
    }
}

extension Networking {
    
    // MARK: Private methods
    private func requestObject<T: BaseMappable>(target: NetworkAPI, type: T.Type) -> Single<T> {
        return self.provider.rx.request(target).mapObject(T.self)
    }
    private func requestArray<T: BaseMappable>(target: NetworkAPI, type: T.Type) -> Single<[T]> {
        self.provider.rx.request(target).subscribe { (response) in
            
        } onError: { (error) in
            
        }
        self.provider.rx.request(target).asObservable().subscribe { (<#Response#>) in
            <#code#>
        } onError: { (<#Error#>) in
            <#code#>
        } onCompleted: {
            <#code#>
        } onDisposed: {
            <#code#>
        }

        return self.provider.rx.request(target).mapArray(T.self)
    }
}
