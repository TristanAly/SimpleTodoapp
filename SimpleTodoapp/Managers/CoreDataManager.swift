//
//  CoreDataManager.swift
//  SimpleTodoapp
//
//  Created by Tristan Aly on 06/06/2022.
//

import Foundation
import CoreData

class CoreDataManager {
   
    static let shared = CoreDataManager()
    let persitentContainer: NSPersistentContainer
    
    private init() {
        persitentContainer = NSPersistentContainer(name: "TodoModel")
        persitentContainer.loadPersistentStores{ _, error in
            if let error = error {
                fatalError("Error initializing Core dat \(error)")
            }
            
        }
    }
    
    
}
