//
//  CoreDataManager.swift
//  iOSSwiftUI
//
//  Created by keshav gn on 04/10/20.
//  Copyright © 2020 keshav gn. All rights reserved.
//

import CoreData

class CoreDataManager {
  static let shared = CoreDataManager()
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Movies")
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        // You should add your own error handling code here.
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()

  var context: NSManagedObjectContext {
    persistentContainer.viewContext
  }
  
  func saveContext() {
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        // The context couldn't be saved.
        // You should add your own error handling here.
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }

}
