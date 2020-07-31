//
//  Group.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import Foundation

struct GroupResponse: Decodable {
    var response: GroupList
}

struct GroupList: Decodable {
    var count: Int
    var items: [GroupItemClass]
}

class GroupItemClass: Codable {
    var photo50: String?
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case photo50 = "photo_50"
        case name = "name"
    }
}
