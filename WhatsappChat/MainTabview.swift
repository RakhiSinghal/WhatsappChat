//
//  MainTabview.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 29/05/24.
//

import SwiftUI

struct MainTabview: View {
    
    var body: some View {
        TabView{
            UpdatesView()
                .tabItem {
                    Label("Updates", systemImage: "circle.dashed.inset.filled") }
            CallView()
                .tabItem {
                    Label("Calls", systemImage: "phone.fill") }
            CoreDataView()
                .tabItem {
                    Label("Communities", systemImage: "person.3.fill") }
            ChatView()
                .tabItem {
                    Label("Chats", systemImage: "message.fill") }
            ProfileView()
                .tabItem {
                    Label("Settings", systemImage: "gear") }
        }
        
    }
}

#Preview {
    MainTabview()
}
