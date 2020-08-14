//
//  DataModel.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/17.
//  Copyright © 2020 SloWax. All rights reserved.
//

import Foundation

struct Category {
    let categoryName: String
    let data: [Data]
}

struct Data {
    let title: String
    let simple: String
    let image: String
    let content: [Content]
}

struct Content {
    let image: String
    let text: String
}
