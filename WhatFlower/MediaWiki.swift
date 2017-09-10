//
//  MediaWiki.swift
//  WhatFlower
//
//  Created by Stephen Skubik-Peplaski on 9/10/17.
//  Copyright © 2017 Stephen Skubik-Peplaski. All rights reserved.
//

import Foundation

struct Response : Codable {
    struct Page : Codable {
        let extract: String
        let ns: Int
        let pageid: Int
        let title: String
    }
    
    struct Query : Codable {
        let pageids: [Int]
        let pages: Array<Dictionary<Int, Page>>
    }
    
    let batchComplete: String
    let query: Query
}
