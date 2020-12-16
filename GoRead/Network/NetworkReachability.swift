//
//  NetworkReachability.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/14.
//  网络监测

import Foundation
import RxSwift
import Alamofire

func networkReachable() -> Observable<Bool> {
    return NetworkReachability.shared.reachable
}
private class NetworkReachability {
    static let shared = NetworkReachability()
    let reachableSubject = ReplaySubject<Bool>.create(bufferSize: 1)
    var reachable: Observable<Bool> {
        return reachableSubject.asObserver()
    }
    init() {
        let manager = NetworkReachabilityManager()
        manager?.listener = { status in
            switch status {
            case .reachable(.ethernetOrWiFi), .reachable(.wwan):
                self.reachableSubject.onNext(true)
            case .notReachable, .unknown:
                self.reachableSubject.onNext(false)
            }
        }
        manager?.startListening()
    }
}
