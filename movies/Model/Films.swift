//
//  Films.swift
//  movies
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import Foundation

struct Films: Decodable {
    let total: Int
    let pages: Int
    let page: Int
    let all: [Film]
    
    enum CodingKeys: String, CodingKey {
        case total = "total_results"
        case pages = "total_pages"
        case page
        case all = "results"
    }
}
