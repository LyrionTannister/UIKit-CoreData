//
//  friendFactory.swift
//  notVK
//
//  Created by Roman on 13.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

struct FriendResponse: Codable {
    var response: FriendList
}

struct FriendList: Codable {
    var count: Int
    var items: [FriendItemStruct]
}

struct FriendItemStruct: Codable {
    var firstName: String
    var lastName: String
    var photo100: String?
    var id: Int
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
        case id
    }
}

