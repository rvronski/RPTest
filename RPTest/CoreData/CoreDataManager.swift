//
//  CoreDataManager.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//


import CoreData

protocol CoreDataManagerProtocol: AnyObject {
    func createLike(text: String, image: Data)
    func getLike() -> [Like]
}

class CoreDataManager: CoreDataManagerProtocol {
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "RPTest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()


    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createLike(text: String, image: Data) {
        let like = Like(context: persistentContainer.viewContext)
        like.image = image
        like.text = text
        saveContext()
    }
    
    func getLike() -> [Like] {
      let request: NSFetchRequest<Like> = Like.fetchRequest()
      var fetchedLikes: [Like] = []
      do {
          fetchedLikes = try persistentContainer.viewContext.fetch(request)
      } catch let error {
         print("Error fetching singers \(error)")
      }
      return fetchedLikes
    }
}
