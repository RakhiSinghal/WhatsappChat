//
//  CoreDataViewModel.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 30/05/24.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntity:[ChatEntity] = []
    init(){
        container = NSPersistentContainer(name:"ChatsContainer")
        container.loadPersistentStores { [self] descriptio, error in
            if let error = error{
                print("error loading\(error)")
            }
            self.fetchChats()
        }}
        func fetchChats(){
            let request = NSFetchRequest<ChatEntity>(entityName:"ChatEntity")
            do{
                savedEntity = try container.viewContext.fetch(request)
            } catch let error{
                print("error fetching\(error)")
            }
        }
        
        func addChats(text: String){
            let newChat = ChatEntity(context: container.viewContext)
            newChat.name = text
            saveData()
        }
        func saveData(){
            do {
                try container.viewContext.save()
                fetchChats()
            } catch let error {
                print("error saving \(error)")
            }
        }
    func deleteFruit(indexSet: IndexSet){
        guard let index = indexSet.first else{return}
        let entity = savedEntity[index]
        container.viewContext.delete(entity)
        saveData()
    }
    func updateChat(entity: ChatEntity ){
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
}




