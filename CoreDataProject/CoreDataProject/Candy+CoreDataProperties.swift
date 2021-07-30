//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by SUPER on 2021/7/30.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    
    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
    
    @NSManaged public var origin: Country?

}

extension Candy : Identifiable {

}
