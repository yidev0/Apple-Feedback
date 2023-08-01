//
//  ListDropDelegate.swift
//  ListDragSample
//
//  Created by Yuto on 2023/08/01.
//

import SwiftUI

struct ItemDropDelegate: DropDelegate {
    let item: Item
    var items: FetchRequest<Item>
    
    func performDrop(info: DropInfo) -> Bool {
        guard (info.itemProviders(for: [.text]).first?.loadObject(ofClass: String.self, completionHandler: { (itemIDString, error) in
            if let itemIDString = itemIDString {
                DispatchQueue.main.async {
                    self.moveItem(itemID: itemIDString)
                }
            }
        })) != nil else {
            return false
        }
        return true
    }
    
    func moveItem(itemID: String) {
        let movedItem = items.wrappedValue.first { $0.uuid == itemID }
        if let movedItem = movedItem {
            movedItem.parent = item
            
            try? PersistenceController.shared.container.viewContext.save()
        }
    }
}
