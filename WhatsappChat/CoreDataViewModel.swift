//
//  CoreDatatBootCamp.swift
//  newNickCoredata
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
            let request = NSFetchRequest<ChatEntity>(entityName: "ChatEntity")
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

struct CoreDatatBootCamp: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                TextField("add chat", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height:55)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal)
                Button(action: {
                    guard !textFieldText.isEmpty else{return}
                    vm.addChats(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                        .cornerRadius(10)
                        .padding(.horizontal)
                })
                
                List{
                    ForEach(vm.savedEntity){ entity in
                        Text(entity.name ?? "no name")
                            .onTapGesture {
                                vm.updateChat(entity: entity)
                            }
                    }.onDelete(perform: vm.deleteFruit)
                }.listStyle(.plain)
                 Spacer()
            }.navigationTitle("Chats")
            
        }
        
    }
}

#Preview {
    CoreDatatBootCamp()
}
