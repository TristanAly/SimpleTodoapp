//
//  SimpleTodoappApp.swift
//  SimpleTodoapp
//
//  Created by Tristan Aly on 31/05/2022.
//

import SwiftUI

@main
struct SimpleTodoappApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            
            let coreDataManager = CoreDataManager.shared
            let vc = coreDataManager.persitentContainer.viewContext //viewContext est le coeur de core data, il va venir tracker tout les changement faite dans le model.
            
            ContentView().environment(\.managedObjectContext, vc)
        }
    }
}
