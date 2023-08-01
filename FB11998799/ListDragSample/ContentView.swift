//
//  ContentView.swift
//  ListDragSample
//
//  Created by Yuto on 2023/08/01.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationSplitView {
            ListView()
                .toolbar {
                    ToolbarItem {
                        Button(action: addItem) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .navigationDestination(for: Item.self) { item in
                    ListView(item: item)
                        .navigationTitle(item.title!)
                }
        } detail: {
            
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.title = "\(Int.random(in: 100..<1000))"
            newItem.uuid = UUID().uuidString
            try? viewContext.save()
        }
    }
}

struct ListView: View {
    
    private var items: FetchRequest<Item>
    
    init(item: Item? = nil) {
        if let item = item {
            self.items = FetchRequest(
                sortDescriptors: [],
                predicate: NSPredicate(format: "parent == %@", item)
            )
        } else {
            self.items = FetchRequest(
                sortDescriptors: [],
                predicate: NSPredicate(format: "parent == nil")
            )
        }
    }
    
    var body: some View {
        List {
            ForEach(items.wrappedValue) { item in
                NavigationLink(value: item) {
                    Text(item.title!)
                }
                .onDrag {
                    return NSItemProvider(object: item.uuid! as NSItemProviderWriting)
                }
                .onDrop(of: [.text], delegate: ItemDropDelegate(item: item, items: items))
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
