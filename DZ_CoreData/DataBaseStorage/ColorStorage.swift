//
//  ProductStorage.swift
//  DZ_CoreData
//
//  Created by Maria Khamitsevich on 10.07.22.
//

import Foundation
import CoreData

struct ColorStorage {
   private let context = AppDataController.shared.context
 
    //MARK: Save
    func saveData(id: UUID, red: Int64, green: Int64, blue: Int64, completion: (() -> Void)? = nil) {
        context.perform {
            let color = Colors(context: context)
            color.id = id
            color.red = red
            color.green = green
            color.blue = blue
            try? context.save()
            completion?()
        }
    }
    
    //MARK: Fetch
    func fetchColor() {
        
    }
    
    func fetchAllColors(_ completion: @escaping ([Colors]) -> Void) {
        context.perform {
            let request = Colors.fetchRequest()
            let colors = try? context.fetch(request)
            let returmColors: [Colors] = colors?.compactMap { $0 } ?? []
            completion(returmColors)
        }
    }
    
    //MARK: Delete
    func deleteColor() {
        
    }
    
    func deleteAllColors(completion: (() -> Void)? = nil) {
        context.perform {
            let request = Colors.fetchRequest()
            request.returnsObjectsAsFaults = false
                do {
                    let results = try context.fetch(request)
                    for object in results {
                        guard let objectData = object as? NSManagedObject else {continue}
                        context.delete(objectData)
                        try? context.save()
                        completion?()
                    }
                } catch let error {
                    print("Detele all data in \(Colors.self) error :", error)
                }
        }
    }
}
