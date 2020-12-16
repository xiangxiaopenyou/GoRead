//
//  MoyaProvider+RxSwift.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/15.
//

import Foundation
import RxSwift
import Moya
import Result

public extension Reactive where Base: MoyaProviderType {
    func request(_ target: Base.Target, callBackQueue: DispatchQueue? = nil) -> Single<Response> {
        let singleResponse: Single<Response> = Single.create { [weak base] (single) in
            let cancelable = base?.request(target, callbackQueue: callBackQueue, progress: nil, completion: { (result) in
                switch result {
                case let .success(response):
                    single(.success(response))
                case let .failure(error):
                    single(.error(error))
                }
            })
            return Disposables.create {
                cancelable?.cancel()
            }
        }
        return singleResponse
    }
}
