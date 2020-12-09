//
//  PeopleModel.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/9.
//

import Foundation

struct People {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension People: CustomStringConvertible {
    var description: String {
        return "name:\(name) age:\(age)"
    }
}
