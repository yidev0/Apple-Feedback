//
//  CoreDataVersionApp.swift
//  CoreDataVersion
//
//  Created by Yuto on 2025/08/17.
//

import SwiftUI
import CoreData

@main
struct CoreDataVersionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
