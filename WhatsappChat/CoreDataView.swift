//
//  ContentView.swift
//  FruitsCoreData
//
//  Created by Rakhi Singhal on 30/05/24.
//

import SwiftUI
import CoreData

struct CoreDataView: View {
    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    @FetchRequest(entity: FruitsEntity().entity, sortDescriptors: [])
    var fruits: FetchedResults<FruitsEntity>

    var body: some View {
        NavigationView {
            List {
                Text("Click on plus to add items")
                ForEach(fruits) { fruit in
                    Text(fruit.name ?? "" )
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newFruit = FruitsEntity(context: viewContext)
            newFruit.name = "orange"
            saveItem()
        }
    }

    func saveItem(){
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            guard let index = offsets.first else {return}
            let fruitEntity = fruits[index]
            viewContext.delete(fruitEntity)
            saveItem()
        }
    }
}


#Preview {
    CoreDataView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
