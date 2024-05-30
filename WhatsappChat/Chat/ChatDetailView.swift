//
//  ChatDetailView.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 29/05/24.
//

import SwiftUI

struct ChatDetailView: View {
//    let storageProvider: StorageProvider
//    @ObservedObject var chat: Chat
//    @State var presentedSheet: Sheet?
////    @SectionedFetchRequest(fetchRequest: Album.sortedByArtistAndRelease,
////                           sectionIdentifier: \Album.artist.name) var albums
//    @SectionedFetchRequest(fetchRequest: Chat.sortedByName,
//                           sectionIdentifier: \Chat.name) var chats
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                HStack {
                    Spacer()
                    Text("Sent Message")
                        .font(.title2)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green.opacity(0.5))
                        )
                }.padding()
                HStack {
                    Text("Received Message")
                        .font(.title2)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.1))
                        )
                    Spacer()
                }.padding()
                
                List {
                    
                  }
                Spacer()
                BottomBar().edgesIgnoringSafeArea(.bottom)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Button{
                            presentationMode.wrappedValue.dismiss()
//                            presentedSheet = .addAlbum
                        }label:{
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                        Image("user1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height:30)
                            .clipShape(Circle())
                        Text("Rakhi").bold()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack{
                        Button{
                        }label:{
                            Image(systemName: "video")
                                .foregroundColor(.black)
                        }
                        Button{
                        }label:{
                            Image(systemName: "phone")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }

}
struct BottomBar: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
            }) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
            }
            Button(action: {
            }) {
                HStack{
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            .frame(width: 200,height: 30)
            .background(.white)
            .cornerRadius(5)
            Button(action: {
            }) {
                Text("₹")
                    .font(.title3)
                    .foregroundColor(.black)
            }
            Button(action: {
            }) {
                    Image(systemName: "mic")
                        .foregroundColor(.black)
            }
            Button(action: {
            }) {
                    Image(systemName: "camera")
                        .foregroundColor(.black)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
extension ChatDetailView {
    enum Sheet: Identifiable {
        case addAlbum
        
        var id: Int {
            self.hashValue
        }
    }
}
#Preview {
    ChatDetailView()
}
