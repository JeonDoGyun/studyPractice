//
//  CoreDataManager.swift
//  trip
//
//  Created by 전도균 on 2023/02/17.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "PlaceInfo")
        persistentContainer.loadPersistentStores { description, error in
            if error != nil {
                fatalError("fail to initialize Core Data : \(String(describing: error))")
            }
        }
    }
}
