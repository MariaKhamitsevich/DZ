//
//  AppDataController.swift
//  DZ_CoreData
//
//  Created by Maria Khamitsevich on 10.07.22.
//

import Foundation
import CoreData

class AppDataController {
    
    let container = NSPersistentContainer(name: "Storage")
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    static let shared = AppDataController()
    
    private init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core data failed to load \(error)")
            }
        }
    }
}
