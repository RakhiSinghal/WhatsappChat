//
//  ChatDetailView.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 29/05/24.
//
import SwiftUI
struct ChatDetailView: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldMsg: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{
            VStack(){
                List{
                    HStack {
                        Text("Add text below")
                            .font(.title3)
                            .padding(5)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.1))
                            )
                        Spacer()
                    }.padding()
                    ForEach(vm.savedEntity){ entity in
                        HStack {
                            Spacer()
                            Text(entity.name ?? "no name")
                                .font(.title3)
                                .padding(5)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.green.opacity(0.4))
                                )
                                .onTapGesture {
                                    vm.updateChat(entity: entity)
                                }
                        } .padding(.vertical, 1)
                    }.onDelete(perform: vm.deleteFruit)
                        .listRowSeparator(.hidden)
                }
                .frame(maxHeight: .infinity)
                .listStyle(.plain)
                .padding(.vertical)
                Spacer()
                //bottom bar
                HStack(spacing:10) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                    HStack{
                        TextField("Add text here", text: $textFieldMsg)
                            .font(.title3)
                            .padding(.leading)
                            .frame(height:30)
                            .background(.white)
                            .cornerRadius(200)
                    }
                    Button(action: {
                        guard !textFieldMsg.isEmpty else{return}
                        vm.addChats(text: textFieldMsg)
                        textFieldMsg = ""
                    }) {        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .edgesIgnoringSafeArea(.bottom)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        }label:{
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                        NavigationLink(destination: ProfileView()) {
                            Image("user1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                        }
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

#Preview {
    ChatDetailView()
}
