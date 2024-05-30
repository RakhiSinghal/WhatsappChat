//
//  WhatsappChatApp.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 29/05/24.
//

import SwiftUI

@main
struct WhatsappChatApp: App {
    
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
