//
//  ChatCellView.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 30/05/24.
//

import SwiftUI

struct ChatCellView: View {
//    @ObservableObject var chat: ChatEntity
    var body: some View {
        HStack{
            Image("user1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height:70)
                .clipShape(Circle())
            Spacer()
                .frame(width: 10)
            VStack(alignment:.leading){
                Text("Rakhi")
                    .bold()
                HStack{
                    Image(systemName: "checkmark").foregroundColor(.blue)
                    Spacer()
                    Text("rakhi isJF JFJFJF JFJ FHGF ssjfvbfvbhfdvhdfvhvdhjgvhghjgbfhjgbfjgbhfhfhfhfhffffffffffff")
                        .foregroundColor(.gray)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                }
            }
            Spacer()
            Text("12:11")
        }
    }
}





#Preview {
    ChatCellView()
}
