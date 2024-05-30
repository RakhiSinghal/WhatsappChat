//
//  ChatDataModel.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 30/05/24.
//

import SwiftUI
import CoreData

class PersistentContainer: NSPersistentContainer {}

/// The main storage provider object in our app
class StorageProvider {
  let persistentContainer: PersistentContainer
  
  var viewContext: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  init() {
    persistentContainer = PersistentContainer(name: "ChatsModel")
    
    persistentContainer.loadPersistentStores { description, error in
      if let error = error {
        fatalError("Core Data store failed to load with error: \(error)")
      }else {
          print("loaded coredata")
      }
    }
  }
  
  func childViewContext() -> NSManagedObjectContext {
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    context.parent = persistentContainer.viewContext
    return context
  }
    
    static func fetchRequest() -> NSFetchRequest<ChatEntity> {
      return NSFetchRequest(entityName: "ChatEntity")
    }
    
    
}

struct ChatDataModel: View {
    @State var viewModel = StorageProvider()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ChatDataModel()
}
