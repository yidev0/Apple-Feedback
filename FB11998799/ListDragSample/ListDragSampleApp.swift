//
//  ListDragSampleApp.swift
//  ListDragSample
//
//  Created by Yuto on 2023/08/01.
//

import SwiftUI

@main
struct ListDragSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
