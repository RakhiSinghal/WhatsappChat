//
//  ChatView.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 29/05/24.
//

import SwiftUI

struct ChatView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var search = ""
    @State private var isadd = false
    @State private var isTapDetails = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing:20){
                List {
                    HStack{
                        Image(systemName: "archivebox")
                            .padding(.horizontal,15)
                        Text("Archived")
                            .bold()
                        Spacer()
                    }
                    NavigationLink(destination: ChatDetailView()){
                        ChatCellView()
                    }
                    ChatCellView()
                    if isadd {
                        Text("ABCCBBCB")
                    }
                }
                .listStyle(.inset)
                .searchable(text: $search)
                .navigationTitle("Chat")
                .navigationBarBackButtonHidden(true)
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                    }label:{
                        Text("...")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack{
                        Button{
                            
                        }label:{
                            Image(systemName: "camera")
                                .foregroundColor(.black)
                        }
                        Button{
                            print("add item")
                            addItem()
                            self.isadd.toggle()
                        }label:{
                            Image(systemName: "plus")
                                .background(.green)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .navigationTitle("Chats")
        }
        .padding()
    }
    
    private func addItem() {
        isadd.toggle()
        withAnimation {
            let newItem = ChatEntity(context: viewContext)
            newItem.name = "iOS dev 3333"
//            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

#Preview {
    ChatView()
}
