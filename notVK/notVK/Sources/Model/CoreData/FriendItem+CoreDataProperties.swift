//
//  FriendItem+CoreDataProperties.swift
//  notVK
//
//  Created by Roman on 31.07.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//
//

import Foundation
import CoreData


extension FriendItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendItem> {
        return NSFetchRequest<FriendItem>(entityName: "FriendItem")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var id: Int16
    @NSManaged public var lastName: String?
    @NSManaged public var photo100: String?

}
