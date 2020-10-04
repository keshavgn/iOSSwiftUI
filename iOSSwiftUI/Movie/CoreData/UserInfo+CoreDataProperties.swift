//
//  UserInfo+CoreDataProperties.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var name: String?

}
