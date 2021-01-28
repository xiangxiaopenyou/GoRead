//
//  NetworkAPI.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/14.
//  用户相关网络接口服务枚举（实现Moya的TargetType协议）

import Foundation
import Moya

enum NetworkAPI {
    case login(path: String, account: String, password: String)
    case test(classId: String)
}

extension NetworkAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: Macros.NetworkURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .login(path: _, account: _, password: _):
            return ""
        case .test(classId: _):
            return "/book-v2"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login(path: _, account: _, password: _):
            return .post
        case .test(classId: _):
            return .get
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
        case .test(classId: let classId):
            params["class_id"] = classId
            params["action"] = "class"
        }
        return params
    }
    
    var task: Task {
        switch self {
        default:
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
