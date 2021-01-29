//
//  PersistanceManager.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import UIKit
import CoreData

final class PersistanceManager: PersistanceContracts {
    typealias T = Article
        
    func save(data: Article) {
        let managedContext =
          persistentContainer.viewContext
        let entity =
          NSEntityDescription.entity(forEntityName: "Favorites",
                                     in: managedContext)!
        let favorites = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        favorites.setValue(data.title, forKey: "title")
        do {
            try managedContext.save()
        } catch {
            
        }
        
    }
    
    func removeData(with title: String, failed: @escaping (PersistanceError) -> Void) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        let request = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try persistentContainer.viewContext.execute(request)
            saveContext()
        } catch {
            failed(.removingError)
        }
    }
    
    func fetchData(completion: @escaping (Result<[Article], PersistanceError>) -> Void) {
        //TODO
    }
    
    func checkData(with title: String, completion: @escaping (Result<Bool, PersistanceError>) -> Void) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            let booksCount = try persistentContainer.viewContext.count(for: fetchRequest)
            if booksCount > 0 {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        } catch {
            completion(.failure(.checkingError))
        }
    }
    
    // MARK: - Core Data stack

    private lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "News")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
}
