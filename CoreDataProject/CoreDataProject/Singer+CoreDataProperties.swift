//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by SUPER on 2021/7/29.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    
    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    @NSManaged public var lastName: String?
    
    var wrappedLastName: String {
        lastName ?? "Unknown"
    }

}

extension Singer : Identifiable {

}
