//
//  ProfileView.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 29/05/24.
//

import SwiftUI

struct ProfileView: View {
    @State var isPresentingPicker = false
    @State var selectedPhoto: UIImage?

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 15)
                {
                    Image("user1")
                        .resizable()
                        .frame(width:150 ,height: 150)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Spacer().frame(height: 10)
                    Text("Rakhi Singhal")
                        .bold()
                        .font(.title)
                    Text("+91 9462746897")
                    Spacer()
                    HStack(){
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray.opacity(0.1))
                                .frame(height: 80)
                            Button{
                            }label:{
                                VStack{
                                    Image(systemName:"message")
                                        .foregroundColor(.green)
                                    Spacer().frame(height: 15)
                                    Text("Message")
                                        .foregroundColor(.black)
                                }}
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.gray.opacity(0.1))
                                .frame(height: 80)
                            Button{
                                
                            }label:{
                                VStack{
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.green)
                                    Spacer().frame(height: 15)
                                    Text("Search")
                                        .foregroundColor(.black)
                                }}
                        }
                    }
                    .padding(.horizontal,20)
                    HStack{
                        VStack {
                            Text("Availabel for chat")
                            Spacer()
                            Text("30 May 2024")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        Spacer()
                    }
                    .padding(.leading,10)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.1))
                    )
                    .padding(.horizontal,20)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.1))
                            .frame(height: 80)
                        Button{
                            isPresentingPicker = true
                        }label:{
                                Text("Image picker")
                                    .foregroundColor(.gray)
                            }
                    }.padding()
                }
            }
            .navigationBarTitle("Profile", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .sheet(isPresented: $isPresentingPicker, content: {
              PhotoPicker(selectedPhoto: $selectedPhoto, dismiss: { self.isPresentingPicker = false })
            })
        }
    }
}

#Preview {
    ProfileView()
}
