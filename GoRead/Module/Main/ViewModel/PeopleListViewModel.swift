//
//  PeopleListViewModel.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/9.
//

import Foundation
import RxSwift

struct PeopleListViewModel {
    let peopleList = Observable<Array>.just([
        People(name: "张三", age: 10),
        People(name: "李四", age: 20),
        People(name: "王五", age: 30)
    ])
}
