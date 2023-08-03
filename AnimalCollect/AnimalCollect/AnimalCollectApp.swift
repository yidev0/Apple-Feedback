//
//  AnimalCollectApp.swift
//  AnimalCollect
//
//  Created by Yuto on 2023/08/02.
//

import SwiftUI

@main
struct AnimalCollectApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
