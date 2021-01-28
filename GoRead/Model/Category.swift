//
//  Category.swift
//  GoRead
//
//  Created by zhangdu_imac on 2021/1/25.
//

import Foundation
import ObjectMapper

struct Category: Mappable {
    
    var categoryId: String?
    var categoryName: String?
    var categoryDescription: String?
    var imageURLString: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        categoryId <- map["type_id"]
        categoryName <- map["typename"]
        categoryDescription <- map["desc"]
        imageURLString <- map["pic"]
    }
}
