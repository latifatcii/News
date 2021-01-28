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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func save(data: Article) {
        let managedContext =
          appDelegate.persistentContainer.viewContext
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
            try appDelegate.persistentContainer.viewContext.execute(request)
            appDelegate.saveContext()
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
            let booksCount = try appDelegate.persistentContainer.viewContext.count(for: fetchRequest)
            if booksCount > 0 {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        } catch {
            completion(.failure(.checkingError))
        }
    }
    
    
}
