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
                            .foregroundColor(.black)
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
                        }label:{
                            Image(systemName: "plus")
                                .padding()
                                .background(.green)
                                .frame(width: 30,height: 30)
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
}
#Preview {
    ChatView()
}
