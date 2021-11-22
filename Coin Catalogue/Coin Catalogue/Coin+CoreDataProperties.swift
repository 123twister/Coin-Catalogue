//
//  Coin+CoreDataProperties.swift
//  Coin Catalogue
//
//  Created by Jay on 16/08/20.
//  Copyright © 2020 Jay Kaushal. All rights reserved.
//
//

import Foundation
import CoreData


extension Coin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coin> {
        return NSFetchRequest<Coin>(entityName: "Coin")
    }

    @NSManaged public var backimg: NSData?
    @NSManaged public var composition: String?
    @NSManaged public var country: String?
    @NSManaged public var currency: String?
    @NSManaged public var event: String?
    @NSManaged public var facevalue: String?
    @NSManaged public var frontimg: NSData?
    @NSManaged public var mint: String?
    @NSManaged public var purchasedate: String?
    @NSManaged public var size: String?
    @NSManaged public var weight: String?
    @NSManaged public var year: String?
    @NSManaged public var name: String?

}
