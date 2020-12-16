//
//  NetworkingAPI.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/14.
//  枚举实现Moya的TargetType协议

import Foundation
import Moya

enum NetworkingAPI {
    case login(path: String, account: String, password: String)
}

extension NetworkingAPI: TargetType {
    
    var baseURL: URL {
        URL(string: Macros.NetworkURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .login(path: _, account: _, password: _):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login(path: _, account: _, password: _):
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var paramaters: [String: Any]? {
        var params: [String: Any] = [:]
        switch self {
        case .login(path: _, account: let account, password: let password):
            params["tel"] = account
            params["password"] = password
        }
        return params
    }
    
    var task: Task {
        switch self {
        case .login(path: _, account: _, password: _):
            if let params = paramaters {
                return.requestParameters(parameters: params, encoding: URLEncoding.default)
            }
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
}
